# The parameters in this file allows for more flexible wording of the steps in the feature file allowing
# anything in the regexp section to match the name field.
ParameterType(
	name: 'type',
	regexp: /(textfield|field|link|button|dropdown|element|accordion|tab|popup|checkbox|searchbutton|message)/,
	type: String,
	transformer: -> (type) {type}
)

ParameterType(
  name: 'the',
  regexp: /(?:on the|in the|into the|the)/,
  type: String,
  transformer: -> (the) {the.to_s}
)

ParameterType(
  name: 'into',
  regexp: /(?:on the|in the|into the|the)/,
  type: String,
  transformer: -> (into) {into.to_s}
)

ParameterType(
  name: 'user',
  regexp: /(?:I|a user|the user|we)/,
  transformer: -> (user) {user.to_s}
)

ParameterType(
  name: 'click',
  regexp: /(?:click|clicks|Click|have clicked)/,
  transformer: -> (click) {click.to_s}
)

ParameterType(
  name: 'enter',
  regexp: /(?:enter a|type|enter)/,
  transformer: -> (enter) {enter.to_s}
)

ParameterType(
  name: 'amount',
  regexp: /(\$[0-9,.]+)/,
  transformer: -> (amount) {amount.to_s}
)

ParameterType(
	name: 'element',
	regexp: /(.*)/,
	type: String,
	transformer: -> (element) {element}
)