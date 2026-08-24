If a parameterised cursor is opened without supplying its required argument, the error is:

PLS-00306

It occurs at the compilation stage.

If the cursor parameter has a DEFAULT value, the cursor can be opened without supplying that argument, and Oracle uses the default value.