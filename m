Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E377135B12
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 15:09:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 315193C2470
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 15:09:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D4FB73C23CB
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 15:09:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4838914019D1
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 15:09:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8DCC4B2E2B;
 Thu,  9 Jan 2020 14:08:54 +0000 (UTC)
Date: Thu, 9 Jan 2020 15:08:53 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200109140853.GB27225@rei.lan>
References: <20200108134807.27001-1-chrubis@suse.cz>
 <278a5c21-348e-5fd8-f33f-82e267028710@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <278a5c21-348e-5fd8-f33f-82e267028710@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: Scan /sys/block/* for stat file
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > The current tst_dev_bytes_written() function works only for simple cases
> > where the block device is not divided into partitions. This patch fixes
> > that scannning the sysfiles for pattern /sys/block/*/devname/stat.
> > 
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > CC: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > CC: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >   lib/tst_device.c | 33 ++++++++++++++++++++++++++++-----
> >   1 file changed, 28 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/tst_device.c b/lib/tst_device.c
> > index 10f71901d..aca769559 100644
> > --- a/lib/tst_device.c
> > +++ b/lib/tst_device.c
> > @@ -373,16 +373,39 @@ int tst_umount(const char *path)
> >   	return -1;
> >   }
> >   
> > +int find_stat_file(const char *dev, char *path, size_t path_len)
> > +{
> > +	const char *devname = strrchr(dev, '/') + 1;
> > +
> > +	snprintf(path, path_len, "/sys/block/%s/stat", devname);
> > +
> > +	if (!access(path, F_OK))
> > +		return 1;
> > +
> > +	DIR *dir = SAFE_OPENDIR(NULL, "/sys/block/");
> > +	struct dirent *ent;
> > +
> > +	while ((ent = readdir(dir))) {
> > +		snprintf(path, path_len, "/sys/block/%s/%s/stat", ent->d_name, devname);
> > +
> > +		fprintf(stderr, "%s\n", path);
> > +
> It will make many noise when using .all_filesystem and we can remove it. 
> Other than, it looks good to me.

That's forgotten debug print, I should have removed that before sending.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
