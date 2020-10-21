Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B37F294CD5
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:39:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0CA03C31A7
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:39:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5E3903C25E9
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:39:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5D2111400E11
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:39:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE6B2AC1F;
 Wed, 21 Oct 2020 12:39:20 +0000 (UTC)
References: <20201020100910.10828-1-chrubis@suse.cz>
 <20201020100910.10828-2-chrubis@suse.cz> <878sbzx66b.fsf@suse.de>
 <20201021100605.GA10861@yuki.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201021100605.GA10861@yuki.lan>
Date: Wed, 21 Oct 2020 13:39:19 +0100
Message-ID: <874kmnwy6g.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib/tst_kconfig: Rewrite the parser internals
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

>> >  
>> > -static inline int match(struct match *match, const char *conf,
>> > -                        struct tst_kconfig_res *result, const char *line)
>> > +static inline int kconfig_parse_line(const char *line,
>> > +                                     struct tst_kconfig_var *vars,
>> > +                                     unsigned int vars_len)
>> >  {
>> > -	if (match->match)
>> > -		return 0;
>> > +	unsigned int i;
>> >  
>> > -	const char *cfg = strstr(line, "CONFIG_");
>> > +	for (i = 0; i < vars_len; i++) {
>> > +		if (!strncmp(vars[i].id, line, vars[i].id_len)) {
>> > +			const char *val = &line[vars[i].id_len];
>> > +
>> 
>> It is valid to have 'CONFIG_VAR = y'. We should probably tokenize the
>> lines first to remove whitespace issues and expose the parser to all
>> possible variable name symbols and values instead of just the ones which
>> appear in our current tests.
>
> I guess that it's techincally possible to have a whitespaces there, but
> will not happen unless you hand-edit the config file before compilation,
> which I doubt will ever happen.
>

It can also happen if someone has their own script to modify the
config. At any rate, if you are confident that it will never happen then
there should be no problem failing hard if it does.

>> > +			switch (val[0]) {
>> > +			case '=':
>> > +				break;
>> > +			case ' ':
>> > +				if (is_set(val, "is not set")) {
>> > +					vars[i].choice = 'n';
>> > +					return 1;
>> > +				}
>> 
>> Typically such lines begin with a comment '#' and I don't see where that
>> is handled. Possibly this will only match non standard configs?
>
> It does work actually, since we use strstr() to get the "CONFIG_" prefix
> from each line of the configuration, but I guess this needs to be fixed
> anyways since we would detect "# CONFIG_FOO=y" as enabled config feature
> even if it's commented. Again this will not happen unless you hand-edit
> the file, but it's probably worth fixing in a follow up patch.

We don't actually use the result of strstr anymore?

>
>> > +				return 1;
>> > +			/* vars[i].id may be prefix to longer config var */
>> > +			default:
>> > +				return 0;
>> > +			}
>> >  
>> > -	if (!cfg)
>> > -		return 0;
>> > +			if (is_set(val, "=y")) {
>> > +				vars[i].choice = 'y';
>> > +				return 1;
>> > +			}
>> >  
>> > -	if (strncmp(cfg, conf, match->len))
>> > -		return 0;
>> > +			if (is_set(val, "=m")) {
>> > +				vars[i].choice = 'm';
>> > +				return 1;
>> > +			}
>> >  
>> > -	const char *val = &cfg[match->len];
>> > +			vars[i].choice = 'v';
>> > +			vars[i].val = strndup(val+1, strlen(val)-2);
>> >  
>> > -	switch (cfg[match->len]) {
>> > -	case '=':
>> > -		break;
>> > -	case ' ':
>> > -		if (is_set(val, "is not set")) {
>> > -			result->match = 'n';
>> > -			goto match;
>> > +			return 1;
>> >  		}
>> > -	/* fall through */
>> > -	default:
>> > -		return 0;
>> > -	}
>> > -
>> > -	if (is_set(val, "=y")) {
>> > -		result->match = 'y';
>> > -		goto match;
>> >  	}
>> >  
>> > -	if (is_set(val, "=m")) {
>> > -		result->match = 'm';
>> > -		goto match;
>> > -	}
>> > -
>> > -	result->match = 'v';
>> > -	result->value = strndup(val+1, strlen(val)-2);
>> > -
>> > -match:
>> > -	match->match = 1;
>> > -	return 1;
>> > +	return 0;
>> >  }
>> >  
>> > -void tst_kconfig_read(const char *const *kconfigs,
>> > -                      struct tst_kconfig_res results[], size_t cnt)
>> > +void tst_kconfig_read(struct tst_kconfig_var vars[], size_t vars_len)
>> >  {
>> > -	struct match matches[cnt];
>> > -	FILE *fp;
>> > -	unsigned int i, j;
>> > -	char buf[1024];
>> > -
>> > -	for (i = 0; i < cnt; i++) {
>> > -		const char *val = strchr(kconfigs[i], '=');
>> > -
>> > -		if (strncmp("CONFIG_", kconfigs[i], 7))
>> > -			tst_brk(TBROK, "Invalid config string '%s'", kconfigs[i]);
>> > +	char line[128];
>> > +	unsigned int vars_found = 0;
>> >  
>> > -		matches[i].match = 0;
>> > -		matches[i].len = strlen(kconfigs[i]);
>> > -
>> > -		if (val) {
>> > -			matches[i].val = val + 1;
>> > -			matches[i].len -= strlen(val);
>> > -		}
>> > -
>> > -		results[i].match = 0;
>> > -		results[i].value = NULL;
>> > -	}
>> > -
>> > -	fp = open_kconfig();
>> > +	FILE *fp = open_kconfig();
>> >  	if (!fp)
>> >  		tst_brk(TBROK, "Cannot parse kernel .config");
>> >  
>> > -	while (fgets(buf, sizeof(buf), fp)) {
>> > -		for (i = 0; i < cnt; i++) {
>> > -			if (match(&matches[i], kconfigs[i], &results[i], buf)) {
>> > -				for (j = 0; j < cnt; j++) {
>> > -					if (matches[j].match)
>> > -						break;
>> > -				}
>> > +	while (fgets(line, sizeof(line), fp)) {
>> > +		char *cfg = strstr(line, "CONFIG_");
>> >  
>> > -				if (j == cnt)
>> > -					goto exit;
>> > -			}
>> > -		}
>> > +		if (!cfg)
>> > +			continue;
>> 
>> This filtering seems unecessary and maybe will hide some corner cases
>> because it reduces kconfig_parses_line's exposure. Also practically
>> every line has 'CONFIG_' in it.
>
> Not really, there are empty lines and plenty of comments in the file
> generated by kernel infrastructure.

It seems about 80-90% of lines contain CONFIG_, however if you pass it
to kconfig_parse_line then this makes more sense. Still I think with
proper parsing this shouldn't be there.

>
>> > +
>> > +		if (kconfig_parse_line(line, vars, vars_len))
>> > +			vars_found++;
>> >  
>> > +		if (vars_found == vars_len)
>> > +			goto exit;
>> >  	}
>> 
>> Generally, this approach seems like to result in spurious TCONFs. We
>> need to properly parse the file and fail if some line can't be
>> interpreted.
>
> Well we do expect well formatted .config file from a start, if you hand
> edit it and put whitespaces into unexpected places more things may
> fail.

Kernel build system seems to have no problem with it. More generally
though we should fail hard if there is something unexpected, not produce
TCONF which people don't check.

>
>> >  exit:
>> > @@ -219,42 +184,63 @@ static size_t array_len(const char *const kconfigs[])
>> >  	return i;
>> >  }
>> >  
>> > -static int compare_res(struct tst_kconfig_res *res, const char *kconfig,
>> > -                       char match, const char *val)
>> > +static int compare_res(struct tst_kconfig_var *var, const char *kconfig,
>> > +                       char choice, const char *val)
>> >  {
>> > -	if (res->match != match) {
>> > -		tst_res(TINFO, "Needs kernel %s, have %c", kconfig, res->match);
>> > +	if (var->choice != choice) {
>> > +		tst_res(TINFO, "Needs kernel %s, have %c", kconfig, var->choice);
>> >  		return 1;
>> >  	}
>> >  
>> > -	if (match != 'v')
>> > +	if (choice != 'v')
>> >  		return 0;
>> >  
>> > -	if (strcmp(res->value, val)) {
>> > -		tst_res(TINFO, "Needs kernel %s, have %s", kconfig, res->value);
>> > +	if (strcmp(var->val, val)) {
>> > +		tst_res(TINFO, "Needs kernel %s, have %s", kconfig, var->val);
>> >  		return 1;
>> >  	}
>> >  
>> >  	return 0;
>> >  }
>> >  
>> > +static inline unsigned int get_len(const char* kconfig)
>> > +{
>> > +	char *sep = index(kconfig, '=');
>> > +
>> > +	if (!sep)
>> > +		return strlen(kconfig);
>> > +
>> > +	return sep - kconfig;
>> > +}
>> > +
>> >  void tst_kconfig_check(const char *const kconfigs[])
>> >  {
>> > -	size_t cnt = array_len(kconfigs);
>> > -	struct tst_kconfig_res results[cnt];
>> > +	size_t vars_cnt = array_len(kconfigs);
>> > +	struct tst_kconfig_var vars[vars_cnt];
>> >  	unsigned int i;
>> >  	int abort_test = 0;
>> >  
>> > -	tst_kconfig_read(kconfigs, results, cnt);
>> > +	memset(vars, 0, sizeof(*vars) * vars_cnt);
>> > +
>> > +	for (i = 0; i < vars_cnt; i++) {
>> > +		vars[i].id_len = get_len(kconfigs[i]);
>> > +
>> > +		if (vars[i].id_len >= sizeof(vars[i].id))
>> > +			tst_brk(TBROK, "kconfig var id too long!");
>> > +
>> > +		strncpy(vars[i].id, kconfigs[i], vars[i].id_len);
>> > +	}
>> > +
>> > +	tst_kconfig_read(vars, vars_cnt);
>> >  
>> > -	for (i = 0; i < cnt; i++) {
>> > -		if (results[i].match == 0) {
>> > +	for (i = 0; i < vars_cnt; i++) {
>> > +		if (vars[i].choice == 0) {
>> >  			tst_res(TINFO, "Missing kernel %s", kconfigs[i]);
>> >  			abort_test = 1;
>> >  			continue;
>> >  		}
>> >  
>> > -		if (results[i].match == 'n') {
>> > +		if (vars[i].choice == 'n') {
>> >  			tst_res(TINFO, "Kernel %s is not set", kconfigs[i]);
>> >  			abort_test = 1;
>> >  			continue;
>> > @@ -263,21 +249,21 @@ void tst_kconfig_check(const char *const kconfigs[])
>> >  		const char *val = strchr(kconfigs[i], '=');
>> >  
>> >  		if (val) {
>> > -			char match = 'v';
>> > +			char choice = 'v';
>> >  			val++;
>> >  
>> >  			if (!strcmp(val, "y"))
>> > -				match = 'y';
>> > +				choice = 'y';
>> >  
>> >  			if (!strcmp(val, "m"))
>> > -				match = 'm';
>> > +				choice = 'm';
>> >  
>> > -			if (compare_res(&results[i], kconfigs[i], match, val))
>> > +			if (compare_res(&vars[i], kconfigs[i], choice, val))
>> >  				abort_test = 1;
>> >  
>> >  		}
>> >  
>> > -		free(results[i].value);
>> > +		free(vars[i].val);
>> >  	}
>> >  
>> >  	if (abort_test)
>> > -- 
>> > 2.26.2
>> 
>> I suppose most of the problems here stem from the original code, but
>> your patch may as well clear it up :-)
>
> Actually the clear way how to fix this is in a separate patch so that
> logical changes are split into different patches.

I suppose that elements of the boolean parser can be used to parse the
kconfig and it can be combined (in a later patch). It's kind of
unecessary to parse a config file into RPN, but will work perfectly well
so we can share some code here.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
