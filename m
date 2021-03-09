Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C44332629
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:08:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7239D3C60B5
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:08:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 86BDD3C05B6
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:08:41 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A236D1A010F2
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:08:40 +0100 (CET)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DvwTb4C9TzRNBB
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 21:06:59 +0800 (CST)
Received: from DGGEML423-HUB.china.huawei.com (10.1.199.40) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 9 Mar 2021 21:08:36 +0800
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 dggeml423-hub.china.huawei.com ([10.1.199.40]) with mapi id 14.03.0513.000;
 Tue, 9 Mar 2021 21:08:27 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
Thread-Index: AdcU5TB9gKcTMJvASAekj8hZ4j+qwA==
Date: Tue, 9 Mar 2021 13:08:27 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038900D9@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

I have resubmit the patch according to your review.

Thanks so much!

Best Regards,
Gongyi

-----------------------------------------------------------------------------------------
> 
> Hi!
> > @@ -34,6 +35,10 @@ static int has_mkfs(const char *fs_type)
> >
> >  	sprintf(buf, "mkfs.%s >/dev/null 2>&1", fs_type);
> >
> > +	if (strstr(buf, "mkfs.tmpfs")) {
> > +		return 1;
> > +	}
> 
> The curly braces around single line statement are useless here.
> 
> Also it would be cleaner if we checked before the sprintf and against the
> fs_type instead with if (!strcmp(fs_type, "tmpfs")).
> 
> We may also print a TINFO message something along the lines:
> 
> 	tst_res(TINFO, "mkfs is not needed for tmpfs");
> 
> >  	ret = tst_system(buf);
> >
> >  	if (WEXITSTATUS(ret) == 127) {
> > @@ -50,17 +55,30 @@ static int has_kernel_support(const char
> *fs_type, int flags)
> >  	static int fuse_supported = -1;
> >  	const char *tmpdir = getenv("TMPDIR");
> >  	char buf[128];
> > +	char template[PATH_MAX];
> >  	int ret;
> >
> >  	if (!tmpdir)
> >  		tmpdir = "/tmp";
> >
> > -	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
> > -	if (errno != ENODEV) {
> > +	sprintf(template, "%s/mountXXXXXX", tmpdir);
> 
> We should at least use snprintf() with sizeof(template) in order not to
> overrun the buffer. Or we can use asprintf() instead and free the buffer
> later on.
> 
> > +	if (mkdtemp(template) == NULL) {
> > +		tst_res(TWARN | TERRNO , "%s: mkdtemp(%s) failed", __func__,
> template);
> > +	}
> 
> I guess that we can tst_brk(TBROK, ""); here if mkdtemp() failed,
> continuing here we would pass non-existing directory thte mount() syscall
> below.
> 
> Also please do not include the __func__ in the message here.
> 
> > +	ret = mount("/dev/zero", template, fs_type, 0, NULL);
> > +	if ((ret && errno != ENODEV) || !ret) {
> > +		if (!ret)
> > +			tst_umount(template);
> >  		tst_res(TINFO, "Kernel supports %s", fs_type);
> > +		if (rmdir(template) == -1)
> > +			tst_res(TWARN | TERRNO, "rmdir %s failed", template);
> 
> We do have SAFE_RMDIR() please use that.
> 
> >  		return 1;
> >  	}
> >
> > +	if (rmdir(template) == -1)
> > +		tst_res(TWARN | TERRNO, "rmdir %s failed", template);
> 
> Here as well.
> 
> >  	/* Is FUSE supported by kernel? */
> >  	if (fuse_supported == -1) {
> >  		ret = open("/dev/fuse", O_RDWR);
> > --
> > 2.17.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
