Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D2C2FC2AC
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 22:48:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E5CB3C30CC
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 22:48:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9B65B3C2657
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 22:48:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 06F3A60067B
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 22:48:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E1F8AC95;
 Tue, 19 Jan 2021 21:48:48 +0000 (UTC)
Date: Tue, 19 Jan 2021 22:48:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <YAdTvomK8qSjpD0l@pevik>
References: <20210119160316.4776-1-pvorel@suse.cz>
 <20210119160316.4776-2-pvorel@suse.cz>
 <YAc5hMnHm0GIQJ96@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAc5hMnHm0GIQJ96@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, kernel-team@android.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Sandeep,

thanks for your comments!

> > +	SAFE_ASPRINTF(NULL, &path, "/lib/modules/%s/%s", uts.release, file);

> This is just the ramdisk location, the on-disk location is
> /vendor/lib/modules/. I also think that the ramdisk one goes away after we
> switch over 2nd stage init. Is there a test I can run that uses these
> functions now to make sure this works?
Any C based test which defines needs_drivers (e.g. fsetxattr02, ioctl08,
uevent01, ...) (or shell based tests with TST_NEEDS_DRIVERS, but you probably
don't run any shell test).

> Also, unfortunately (and sadly) we may have to do something Android specific
> downstream as the /vendor/lib/modules and /lib/modules only started to appear
> as of android 11 :(.
Feel free to send a patch upstream. If not that much complicated and you're
willing to maintain it, it might get to upstream (depends on other maintainers,
but we're quite open).

> Once you share how I can test, I'm happy to test and add my Tested-by for
> Android.

> +cc: kernel-team@android.com
> > +
> > +	if (stat(path, &st) || !(S_ISREG(st.st_mode) || S_ISLNK(st.st_mode))) {
> > +		tst_resm(TWARN, "expected file %s does not exist or not a file", path);
> > +		return -1;
> > +	}
> > +
> > +	if (access(path, R_OK)) {
> > +		tst_resm(TWARN, "file %s cannot be read", path);
> > +		return -1;
> > +	}
> > +
> > +	SAFE_ASPRINTF(NULL, &search, "/%s.ko", driver);
> > +
> > +	f = SAFE_FOPEN(NULL, path, "r");
> > +
> > +	while (fgets(buf, sizeof(buf), f)) {
> > +		if (sscanf(buf, "%s", module) != 1)
> > +			continue;
> > +
> > +		if (strstr(module, search) != NULL) {
> > +			SAFE_FCLOSE(NULL, f);
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	SAFE_FCLOSE(NULL, f);
> > +
> > +	return -1;
> > +}
> > +
> > +int tst_check_driver_(const char *driver)
> > +{
> > +	if (!tst_search_driver(driver, "modules.dep") ||
> > +		!tst_search_driver(driver, "modules.builtin"))
> > +		return 0;
> > +
> > +	return 1;
> > +}
> > +
> > +int tst_check_driver(const char *driver)
> > +{
> > +#ifdef __ANDROID__
> > +	/*
> > +	 * Android may not have properly installed modules.* files. We could
> > +	 * search modules in /system/lib/modules, but to to determine built-in

> the appropriate location would be /lib/modules OR /vendor/lib/modules.
OK. I tested only old aosp (Oreo, Nougat and KitKat).
Out of curiosity, does have Android 11 modules.{builtin,dep}? If yes, it'd make
sense to treat it as Linux (apply "modules always available" approach only if
files aren't available).

Kind regards,
Petr

> > +	 * drivers we need modules.builtin. Therefore assume all drivers are
> > +	 * available.
> >  	 */
> >  	return 0;
> >  #endif

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
