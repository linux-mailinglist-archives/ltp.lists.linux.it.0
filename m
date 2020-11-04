Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 461622A5EB9
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:30:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA9A23C5442
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:30:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 18B223C25E0
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:30:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 307281401434
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:30:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00B75AC8C;
 Wed,  4 Nov 2020 07:30:10 +0000 (UTC)
Date: Wed, 4 Nov 2020 08:30:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20201104073008.GB8632@pevik>
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201103191327.11081-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103191327.11081-4-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 03/11] docparse: Add test documentation parser
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Cyril Hrubis <metan@ucw.cz>, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> --- /dev/null
> +++ b/docparse/docparse.c

...
> +const char *next_token(FILE *f, struct data_node *doc)
> +{
> +	size_t i = 0;
> +	static char buf[4096];
> +	int c;
> +	int in_str = 0;
> +
> +	for (;;) {
> +		c = fgetc(f);
> +
> +		if (c == EOF)
> +			goto exit;
> +
> +		if (in_str) {
> +			if (c == '"') {
> +				if (i == 0 || buf[i-1] != '\\') {
> +					buf[i++] = c;
> +					goto exit;
> +				}
IMHO this change (adding buf[i++] = c;), which Li suggested,
is causing build failures:
https://travis-ci.org/github/pevik/ltp/builds/741217630

/usr/src/ltp/docparse/testinfo.pl metadata.json
, or ] expected while parsing array, at character offset 340 (before "",\n      "0c461cb72...") at /usr/src/ltp/docparse/testinfo.pl line 379.
make[1]: *** [/usr/src/ltp/docparse/Makefile:60: txt] Error 255
make[1]: Leaving directory '/usr/src/ltp-build/docparse'
make: *** [/usr/src/ltp/Makefile:108: docparse-all] Error 2
make: *** Waiting for unfinished jobs....

It's strange that it's not failing in all tests.

Anyway, test is working without it:
https://travis-ci.org/github/pevik/ltp/builds/741322879

@@ -138,10 +138,8 @@ const char *next_token(FILE *f, struct data_node *doc)

                if (in_str) {
                        if (c == '"') {
-                               if (i == 0 || buf[i-1] != '\\') {
-                                       buf[i++] = c;
+                               if (i == 0 || buf[i-1] != '\\')
                                        goto exit;
-                               }
                        }

                        buf[i++] = c;
----

Li, could you please comment?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
