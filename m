Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1F2FD3C5
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 16:21:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DDEE3C78E3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 16:21:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EEFB93C02FA
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 16:21:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6B4E360057B
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 16:21:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B755EAAAE;
 Wed, 20 Jan 2021 15:21:33 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:21:31 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YAhKe84FcrNEYFcC@pevik>
References: <20210119160316.4776-1-pvorel@suse.cz>
 <20210119160316.4776-2-pvorel@suse.cz> <YAg6wTVc6AB28smR@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAg6wTVc6AB28smR@yuki.lan>
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> > +	while (fgets(buf, sizeof(buf), f)) {
> > +		if (sscanf(buf, "%s", module) != 1)
> > +			continue;

> What is the point in the sscanf() here?

> Why can't we just strstr(buf, search) here?

modules.dep has format:
module:[dependency [another-dependency ...]]

e.g.:
kernel/arch/x86/kernel/cpu/mce/mce-inject.ko.xz:
kernel/arch/x86/crypto/twofish-x86_64.ko.xz: kernel/crypto/twofish_common.ko.xz
kernel/arch/x86/crypto/aesni-intel.ko.xz: kernel/crypto/crypto_simd.ko.xz kernel/crypto/cryptd.ko.xz kernel/arch/x86/crypto/glue_helper.ko.xz

First reading "%s" reads only first module with ':' separator.
Searching without it could find first module which is as dependency (e.g.
"/twofish_common.ko.xz" instead of "/twofish-x86_64.ko.xz"). Although that
shouldn't be a problem, because it's very unlikely that module dependency is
missing. Do you want me to drop sscanf() or put some comment?

Also man modules.dep(5) warns about using text format as "their format is
subject to change in the future". Hopefully we can depend on it. Or should we
use binary format?

...
> > +	if (!tst_check_driver_(driver))
> > +		return 0;
> > +
> > +	if (strrchr(driver, '-') || strrchr(driver, '_')) {
> > +		char *driver2 = strdup(driver);
> > +		char *ix = driver2;
> > +		char find = '-', replace = '_';
> > +
> > +		if (strrchr(driver, '_')) {
> > +			find = '_';
> > +			replace = '-';
> > +		}
> > +
> > +		while ((ix = strchr(ix, find)) != NULL) {
> > +			*ix++ = replace;
> > +		}

> Just:
> 		while ((ix = strchr(ix, find))
> 			*ix++ = replace;

> > +		if (!tst_check_driver_(driver2))

> free(driver2) ?

Oops, you're right. + path and search path in tst_search_driver()
Below are new versions.

Kind regards,
Petr

static int tst_search_driver(const char *driver, const char *file)
{
	struct stat st;
	char *path = NULL, *search = NULL;
	char buf[PATH_MAX], module[PATH_MAX];
	FILE *f;
	int ret = -1;

	struct utsname uts;

	if (uname(&uts)) {
		tst_brkm(TBROK | TERRNO, NULL, "uname() failed");
		return -1;
	}
	SAFE_ASPRINTF(NULL, &path, "/lib/modules/%s/%s", uts.release, file);

	if (stat(path, &st) || !(S_ISREG(st.st_mode) || S_ISLNK(st.st_mode))) {
		tst_resm(TWARN, "expected file %s does not exist or not a file", path);
		return -1;
	}

	if (access(path, R_OK)) {
		tst_resm(TWARN, "file %s cannot be read", path);
		return -1;
	}

	SAFE_ASPRINTF(NULL, &search, "/%s.ko", driver);

	f = SAFE_FOPEN(NULL, path, "r");

	while (fgets(buf, sizeof(buf), f)) {
		if (sscanf(buf, "%s", module) != 1)
			continue;

		if (strstr(module, search) != NULL) {
			ret = 0;
			break;
		}
	}

	SAFE_FCLOSE(NULL, f);
	free(search);
	free(path);

	return ret;
}

static int tst_check_driver_(const char *driver)
{
	if (!tst_search_driver(driver, "modules.dep") ||
		!tst_search_driver(driver, "modules.builtin"))
		return 0;

	return 1;
}

int tst_check_driver(const char *driver)
{
#ifdef __ANDROID__
	/*
	 * Android may not have properly installed modules.* files. We could
	 * search modules in /system/lib/modules, but to to determine built-in
	 * drivers we need modules.builtin. Therefore assume all drivers are
	 * available.
	 */
	return 0;
#endif

	if (!tst_check_driver_(driver))
		return 0;

	int ret = 1;

	if (strrchr(driver, '-') || strrchr(driver, '_')) {
		char *driver2 = strdup(driver);
		char *ix = driver2;
		char find = '-', replace = '_';

		if (strrchr(driver, '_')) {
			find = '_';
			replace = '-';
		}

		while ((ix = strchr(ix, find)))
			*ix++ = replace;

		ret = tst_check_driver_(driver2);
		free(driver2);
	}

	return ret;
}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
