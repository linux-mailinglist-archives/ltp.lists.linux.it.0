Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863013BD9B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 11:39:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58C123C2487
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 11:39:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3E8BC3C1840
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 11:39:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AF8CF20152C
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 11:39:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CA60AC37;
 Wed, 15 Jan 2020 10:39:52 +0000 (UTC)
Date: Wed, 15 Jan 2020 11:39:51 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200115103951.GA24851@dell5510>
References: <20200108134807.27001-1-chrubis@suse.cz>
 <278a5c21-348e-5fd8-f33f-82e267028710@cn.fujitsu.com>
 <20200109140853.GB27225@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109140853.GB27225@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> > > +int find_stat_file(const char *dev, char *path, size_t path_len)
> > > +{
> > > +	const char *devname = strrchr(dev, '/') + 1;
> > > +
> > > +	snprintf(path, path_len, "/sys/block/%s/stat", devname);
> > > +
> > > +	if (!access(path, F_OK))
> > > +		return 1;
> > > +
> > > +	DIR *dir = SAFE_OPENDIR(NULL, "/sys/block/");
> > > +	struct dirent *ent;
> > > +
> > > +	while ((ent = readdir(dir))) {
> > > +		snprintf(path, path_len, "/sys/block/%s/%s/stat", ent->d_name, devname);
> > > +
> > > +		fprintf(stderr, "%s\n", path);
> > > +
> > It will make many noise when using .all_filesystem and we can remove it. 
> > Other than, it looks good to me.

> That's forgotten debug print, I should have removed that before sending.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
