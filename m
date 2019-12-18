Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5D12440E
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 11:14:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08E0B3C22B6
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 11:14:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 913973C22B6
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 11:14:03 +0100 (CET)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E6F8014016ED
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 11:14:02 +0100 (CET)
Received: by mail-lj1-x242.google.com with SMTP id e28so1461890ljo.9
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkVnZbNEjz+sLN6j+5FdBzRJ0r9sDzS1wR4+ENG0GJ0=;
 b=FYupUvgVHV44rs6H6B2UfdeelyFt5eqirkD7OZieJDGg6RQUAJNxb5nNUJcNl4yvQ5
 U1AQF/EYfDJf4LOYtwKMzMr91s/YRg5q7zCH9O4g/SIckbCSJMSb9+CetPdET4Vn3TFR
 b6uNtbYJK4m+3OGmKc5IiB052ynty2yoXiXbmpLBMJ/IYklFb7b0ZmwEgitEUY04txhK
 iTm+DrzPdptJ8AKGWnS9/zB8Zymu2JhqO3s6XzFJLgdW2Zi4QLjM9dYVR3W8kxnondIs
 vskN103gaYEOGdeIeg6q+D/05sg29dORL6wdZSEBJ1+4iHCvpchkBryR5tvpg2hUqRP7
 cUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkVnZbNEjz+sLN6j+5FdBzRJ0r9sDzS1wR4+ENG0GJ0=;
 b=VTcbj2WvLkv1B8aVLNNysdR9zDl9pQQOu8Cfsb0BcQb4C6I2TW8NoSw72AzfKrpCX3
 4sYBsUwVN7+4qRpcQa599HAtVRjL9roQBi7vq7hnrKmHd7GZMBPsGZEaTxGGf9Va8zAU
 3Dzot7fBpKXfA9TAEEtoJ1PqDoQQ4aHvSV9VPJBwo5HDlA+NpODnGL7EZq9HzEnzWsX7
 +fXCtdM9pBf3YXpMS/iszwWWjrjD68Ff/RezrqtK9VNulzcZCnq2CE4smSNOPbPF/22b
 7o4/OTim6X3ywqYVohwgk9LrgptqYeoDlhCyakVcHYVGdg8FSaudLQrMx1wV7iqhiRmQ
 VHmg==
X-Gm-Message-State: APjAAAUWnwLAqbm/sqtQ0D4/JigTZBBoGuC4sus7xKNsIBm53J8jdvdi
 YFXgObinSMSTkv6cc2B3jOSYD7gnOgJkDagNoiRWrw==
X-Google-Smtp-Source: APXvYqwquvG1XVELykXPhmx/GzMi/wptJkmMa/HoL+lc4C/lyrXhJhGh9ppp3u1l7nAbI7lMZYO/LketmV8KJHTjiXc=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr101950ljj.191.1576664042123; 
 Wed, 18 Dec 2019 02:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
In-Reply-To: <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 18 Dec 2019 15:43:50 +0530
Message-ID: <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
To: Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

+ Cyril (who originally proposed upper bound check)

On Wed, 18 Dec 2019 at 14:55, Jan Stancek <jstancek@redhat.com> wrote:
>
>
> ----- Original Message -----
> > " The test's assumptions are fundamentally false; it thinks it can look
> > at IO counters (tst_dev_bytes_written) for a disk before and after a
> > system call, and attribute all of the IO seen to the system call that
> > was made - this isn't necessarily correct. Other processes may generate
> > IO in the background.
>
> We create our own block device, so there shouldn't be other processes
> writing to it.
>
> > ext4 defers a lot of IO on a freshly made filesystem to the kernel -
> > for example it will initialize the journal and inode tables after the
> > mount
>
> Journal was my guess as well.

To avoid similar scenarios, I suggested to add a "sync()" call just
prior to test here [1]. And I couldn't reproduce the failure in
1000-times run with 4.19 kernel.

Also, I think having a "sync()" call becomes more important in case we
remove the upper bound otherwise test might not provide reliable
results.

[1] http://lists.linux.it/pipermail/ltp/2019-October/014157.html

-Sumit

>
> > Let's remove the toplimit of write back, and think as long as we synced
> > at least the expected amount, the test passes. The +10% limit seems
> > arbitrary.
>
> I think this is reasonable approach until we find better way
> to measure what was synced.
>
> Acked-by: Jan Stancek <jstancek@redhat.com>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
