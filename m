Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60324570414
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jul 2022 15:20:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6ACCE3CA72A
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jul 2022 15:20:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A34F53CA4A5
 for <ltp@lists.linux.it>; Mon, 11 Jul 2022 15:20:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E46E360076D
 for <ltp@lists.linux.it>; Mon, 11 Jul 2022 15:20:15 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DC89B22888;
 Mon, 11 Jul 2022 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657545614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nX/qIF24sIotylGD4es/nvhZByqYs6L1OONQfuxDWVk=;
 b=yvqBgeFhUmwYKN6ALQ8+rwcaKPen1InvHyOv8bNSdFa1PgY7mXSugxCKKl8/cUzGGxyond
 /57YZFRxEAcR7VGMFZ3A8KH15sPdZSX/naTEVt78WIDwx9tb2O6t3saDJw8SuhkhHYHM8P
 ZKmVjGqzTjFf43GcmcsU1vjv9gd9acQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657545614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nX/qIF24sIotylGD4es/nvhZByqYs6L1OONQfuxDWVk=;
 b=QvZYIbmmDoGZFZvE8LHmW1uMxf+UaCyzGZ4Wpztxye3vsvqP5ZsQdGkdZbnbYwpiGkP54F
 2+Mnkdq9hpSa7UAw==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9EDA42C141;
 Mon, 11 Jul 2022 13:20:14 +0000 (UTC)
References: <b30a6712179ead9c8a5556d82a4ac386904c9b4d.1657265564.git.jstancek@redhat.com>
 <87fsj7onim.fsf@suse.de>
 <CAASaF6yQTmak7p5JZJFvBd-+qLsHNvimg7HvRQQQH9vjWGOMXg@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
Date: Mon, 11 Jul 2022 14:11:44 +0100
In-reply-to: <CAASaF6yQTmak7p5JZJFvBd-+qLsHNvimg7HvRQQQH9vjWGOMXg@mail.gmail.com>
Message-ID: <87bktvokfl.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_find_backing_dev: fix logic in matching mount
 point
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Jan Stancek <jstancek@redhat.com> writes:

> On Mon, Jul 11, 2022 at 2:13 PM Richard Palethorpe <rpalethorpe@suse.de> wrote:
>>
>> Hello,
>>
>> Jan Stancek <jstancek@redhat.com> writes:
>>
>> > If backing dev is btrfs root device, then starting best_match_len
>> > from 1 creates an issue, because root (/) is never matched.
>> > Also we should check that entire mount point string is present in
>> > path we are matching against.
>> >
>> > In case there's error also dump /proc/self/mountinfo before tst_brk.
>> >
>> > This fixes test with following partition layout (TMPDIR is on /):
>> >   # cat /proc/self/mountinfo  | grep btrfs
>> >   59 1 0:29 /root / rw,relatime shared:1 - btrfs /dev/dasda2 rw,seclabel,compress=zstd:1,ssd,space_cache=v2,subvolid=257,subvol=/root
>> >   93 59 0:29 /home /home rw,relatime shared:47 - btrfs /dev/dasda2 rw,seclabel,compress=zstd:1,ssd,space_cache=v2,subvolid=256,subvol=/home
>> >
>> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> > ---
>> >  lib/tst_device.c | 17 ++++++++++++-----
>> >  1 file changed, 12 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/lib/tst_device.c b/lib/tst_device.c
>> > index c34cbe6d1f56..414bf0eea816 100644
>> > --- a/lib/tst_device.c
>> > +++ b/lib/tst_device.c
>> > @@ -506,12 +506,17 @@ unsigned long tst_dev_bytes_written(const char *dev)
>> >       return dev_bytes_written;
>> >  }
>> >
>> > -static int count_match_len(const char *first, const char *second)
>> > +static int str_starts_with(const char *str, const char *prefix)
>> >  {
>> >       int len = 0;
>> >
>> > -     while (*first && *first++ == *second++)
>> > +     while (*prefix) {
>> > +             if (!*str)
>> > +                     return 0;
>> > +             if (*str++ != *prefix++)
>> > +                     return 0;
>> >               len++;
>> > +     }
>>
>> I'm not sure this is better than the original. It's a seperate cleanup
>> in any case.
>
> The difference is that partial matches now returns 0. Previously it did not,
> it only counted number of matching characters. So for example ("/foobar" "/foo")
> appeared as better match than ("/foobar", "/")

Ah, sorry.

>
>>
>> >
>> >       return len;
>> >  }
>> > @@ -524,7 +529,7 @@ void tst_find_backing_dev(const char *path, char *dev)
>> >       char *pre = NULL;
>> >       char *next = NULL;
>> >       unsigned int dev_major, dev_minor, line_mjr, line_mnr;
>> > -     unsigned int len, best_match_len = 1;
>> > +     unsigned int len, best_match_len = 0;
>> >       char mnt_point[PATH_MAX];
>> >
>> >       if (stat(path, &buf) < 0)
>> > @@ -550,7 +555,7 @@ void tst_find_backing_dev(const char *path, char *dev)
>> >                       break;
>> >               }
>> >
>> > -             len = count_match_len(path, mnt_point);
>> > +             len = str_starts_with(path, mnt_point);
>> >               if (len > best_match_len) {
>> >                       strcpy(dev, pre);
>> >                       best_match_len = len;
>> > @@ -559,8 +564,10 @@ void tst_find_backing_dev(const char *path, char *dev)
>> >
>> >       SAFE_FCLOSE(NULL, file);
>> >
>> > -     if (!*dev)
>> > +     if (!*dev) {
>> > +             tst_system("cat /proc/self/mountinfo");
>> >               tst_brkm(TBROK, NULL, "Cannot find block device for %s", path);
>> > +     }
>> >
>> >       if (stat(dev, &buf) < 0)
>> >               tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);
>> > --
>> > 2.27.0
>>
>> Makes sense. However I suspect this function can be replaced with the
>> standard library method used in tst_stat_mount_dev. I didn't try this
>> before because I'm not sure why it scans mountinfo instead of mounts.
>
> /proc/self/mounts doesn't contain major/minor numbers, which is primarily what
> tst_find_backing_dev is using.

Does anyone know a situation where checking the mount path doesn't work?
It seems like we are just checking the device numbers first for
historical reasons and not because it is necessary.

I haven't seen any failure reports for io_control01 which only checks
the path with tst_stat_mount_dev. However this test only runs if you
have CG v2 enabled by default.

>
>>
>>
>> --
>> Thank you,
>> Richard.
>>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
