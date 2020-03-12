Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB302182F50
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 12:35:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5A883C5E80
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 12:35:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 035AB3C1CE5
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 12:35:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 86C8A1001F3D
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 12:35:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 62376ABEF;
 Thu, 12 Mar 2020 11:35:36 +0000 (UTC)
Date: Thu, 12 Mar 2020 12:35:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200312113534.GA28962@dell5510>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
 <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
 <20200311102620.GB3802@rei.lan>
 <20200312110340.y7mcfktrlgyzfui6@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312110340.y7mcfktrlgyzfui6@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> Is everyone fine with this code now :)

> int tst_is_mounted(const char *path)
> {
>         char line[PATH_MAX];
>         FILE *file;
>         int ret = 0;

>         file = SAFE_FOPEN(NULL, "/proc/mounts", "r");

>         while (fgets(line, sizeof(line), file)) {
>                 if (strstr(line, path) != NULL) {
>                         ret = 1;
>                         break;
>                 }
>         }

>         SAFE_FCLOSE(NULL, file);

>         if (!ret)
>                 tst_resm(TINFO, "No device is mounted at %s", path);

>         return ret;
> }

> int tst_is_mounted_at_tmpdir(const char *path)
> {
>         char cdir[PATH_MAX], mpath[PATH_MAX];
>         int ret;

>         if (!getcwd(cdir, PATH_MAX))
>                 return 0;
LGTM. I guess we can ignore this, but maybe tst_res(TWARN | TERRNO, "..."),
could be added here. But maybe it's not important.

>         ret = snprintf(mpath, PATH_MAX, "%s/%s", cdir, path);
>         if (ret < 0 || ret >= PATH_MAX)
>                 return 0;

>         return tst_is_mounted(mpath);
> }

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
