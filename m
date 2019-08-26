Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A59CE51
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 13:40:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 770B83C1C8A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 13:40:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1412C3C02A0
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 13:40:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 35756201167
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 13:40:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 51B36ABE7
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 11:40:32 +0000 (UTC)
Date: Mon, 26 Aug 2019 13:47:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20190826114743.GB15568@haruka>
References: <20190820151831.7418-1-chrubis@suse.cz>
 <20190820151831.7418-3-chrubis@suse.cz>
 <1566405322.3587.21.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566405322.3587.21.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/5] kernel/uevent: Add uevent01
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
> > +
> > +	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
> 
> Maybe it isn't worth to check if dev_num is a valid number.

Sure.

> > +
> > +	snprintf(ev_msg, sizeof(ev_msg),
> > +	         "change@/devices/virtual/block/loop%i", dev_num);
> > +
> > +	snprintf(ev_dev_path, sizeof(ev_dev_path),
> > +	         "DEVPATH=/devices/virtual/block/loop%i", dev_num);
> > +
> > +	snprintf(ev_dev_minor, sizeof(ev_dev_minor), "MINOR=%i",
> > dev_num);
> > +	snprintf(ev_dev_name, sizeof(ev_dev_name), "DEVNAME=loop%i",
> > dev_num);
> > +
> > +	const struct uevent_desc *const uevents[] = {
> > +		&desc,
> > +		&desc,
> > +		NULL
> > +	};
> > +
> > +	pid = SAFE_FORK();
> > +	if (!pid) {
> > +		fd = open_uevent_netlink();
> > +		TST_CHECKPOINT_WAKE(0);
> > +		wait_for_uevents(fd, uevents);
> 
> For me it wasn't obvious that wait_for_uevents() does the exit(). Not
> sure if we should do the exit better here or name the function like
> exit_on_uevents().

I was just lazy, I guess that the cleanest solution would be to call the
exit here after the wait_for_uevents() call.

> > +	}
> > +
> > +	TST_CHECKPOINT_WAIT(0);
> > +
> > +	generate_device_events(dev_path);
> > +
> > +	wait_for_pid(pid);
> > +}
> > +
> > +static struct tst_test test = {
> > +	.test_all = verify_uevent,
> > +	.forks_child = 1,
> > +	.needs_tmpdir = 1,
> 
> Just curious, where do we need the tmpdir?

We are creating a disk image to be attached to the loop device in the
generate_device_events().

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
