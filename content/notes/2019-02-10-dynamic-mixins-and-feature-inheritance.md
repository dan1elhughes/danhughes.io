---
title: "Dynamic mixins and feature inheritance"
date: 2019-02-10T13:33:00Z
draft: false
---

This is an interesting bit of code I was playing with to dynamically inherit from multiple classes. Note that this isn't something I'd recommend using - it's somewhat hard to read and reason about, and I have no idea of the performance impact.

## Version 1

```js
// Library function which is used as the "extends" call.
const mix = (...mixins) =>
	mixins.reduce(
		(combinedClass, mixinApplier) => mixinApplier(combinedClass),
		class {}
	);

// These features can be shared across many classes.
const FooFeature = superclass =>
	class extends superclass {
		foo() {
			console.log("foo");
		}
	};
const BarFeature = superclass =>
	class extends superclass {
		bar() {
			console.log("bar");
		}
	};

// Our final class inherits from all the declared features.
class MyThing extends mix(FooFeature, BarFeature) {
	constructor(...args) {
		super(...args);
		console.log("I'm a proper instance");
	}
}

const instance = new MyThing(); // => I'm a proper instance
instance.foo() // => foo
instance.bar() // => bar
```

I didn't particularly like the `mix` syntax, and it didn't strike me as very declarative in the style of the React code I'd been writing. I rewrote it so that the parent classes can be defined within the child class.

## Version 2

```js
class Mixable {
	constructor() {
		this.constructor[Mixable.extends].forEach(mixin =>
			Object.assign(this, mixin)
		);
	}
}

const FooFeature = {
	foo() {
		console.log("foo");
	}
};

const BarFeature = {
	bar() {
		console.log("bar");
	}
};

class MyThing extends Mixable {
	static get [Mixable.extends]() {
		return [FooFeature, BarFeature];
	}

	constructor(...args) {
		super(...args);
		console.log("I'm a proper instance");
	}
}

const instance = new MyThing(); // => I'm a proper instance
instance.foo(); // => foo
instance.bar(); // => bar
```

I prefer this, but the `static get [Mixable.extends]()` syntax is a bit much. I did it like this so that there's no chance the extension declaration can clash with a method name, but it's hard to read.

Again, this isn't something I recommend doing - I just thought it was interesting.
