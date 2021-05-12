Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518F37BF10
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:59:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA3923C8AA9
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:59:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DDC363C644F
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:59:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 36B17600D55
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620827970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZibOzA3roQx7J10skHUYFEVxQQ6t9flNd7C+9s8BLSI=;
 b=BWFIBZgg0XsoCXq6P8PC1r7Bhel2OFIAsuRUMfVpC+e3S/Yj+1p/aYGsy+gFE6t07J+R0O
 hAf9p3U+OqQvdqtA7OdhT80hLWU5m0HjcLVXtWtVxycjxLlBXOEWYmQsGhM8o0LpE7z1tY
 WMwvGkCY3lZuak3rVho1UOBwEpuNb5E=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-1QaD0DWhNieY7xwnW8hdDA-1; Wed, 12 May 2021 09:59:27 -0400
X-MC-Unique: 1QaD0DWhNieY7xwnW8hdDA-1
Received: by mail-oo1-f72.google.com with SMTP id
 n22-20020a4ad4160000b02901e94af54f75so11102331oos.17
 for <ltp@lists.linux.it>; Wed, 12 May 2021 06:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZibOzA3roQx7J10skHUYFEVxQQ6t9flNd7C+9s8BLSI=;
 b=iqRIZ3F3Wcu884kuccIy9LDELjQqUAMoyndQi44jMPQrVkG+c4ZBEFYCBi3bUASLtL
 wdu5fb+XvLRlpuMIkcQ0UzjRXcKgZdftpSYMvWDNxUZRpcmysVYAehZL0XM2727RPswk
 QqRj/0em01UlKXZojPYsxDHlCTz6tlEcocjZKh3zrSX/wOF+tuMOJb+VmPYMfy72Q2ZT
 MvduliVAp31DMwqTCZd2UVswvo1x2boOu3ruy4xa59AzOlj7s6OPrM/C1i8TgO349RJH
 a4h0aSxcSM8fF4iS8UgeZyxdK0bBnhFXY7ndDmkL747+dz3uvTeaqqe2f5I2KKdejMRv
 Dszg==
X-Gm-Message-State: AOAM532JWSSqOYi64uj+6nnaK7jjd5k3nJbTXV67WP2zagoW6owFqd4c
 zuHNK8vAPauD+1kBFHFHX4Ywzg+4NHaHEFXGFJehyVkYEA7Jg0anl6XKpq70Zy4pjgX834qFRhT
 mDkk2WzIcOMMmmxxjWad8ZkikFKA=
X-Received: by 2002:aca:b954:: with SMTP id j81mr26017751oif.45.1620827966164; 
 Wed, 12 May 2021 06:59:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2goGx/UQImx0IC9UgbrSoeZjE7oGEObxiU63pj+RsTn+aJhRuxAYEEvJ6NszfQhO0z6uU5I1MIgQsly6xk5Y=
X-Received: by 2002:aca:b954:: with SMTP id j81mr26017737oif.45.1620827966017; 
 Wed, 12 May 2021 06:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210510134739.37512-1-cascardo@canonical.com>
 <YJoh1f4EWtQWlroC@pevik> <20210511103622.GC12149@mussarela>
 <YJvVeOpV2Zt6B31X@yuki> <YJveYWhSPvzd9Ehj@pevik>
In-Reply-To: <YJveYWhSPvzd9Ehj@pevik>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 12 May 2021 15:59:09 +0200
Message-ID: <CAASaF6xvTRXL-pXO9Sr5qH+VZKM7vnkB6KhohoEZRV8epbZ+-w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: force block size to 1024 for ext3 and ext4
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

On Wed, May 12, 2021 at 3:55 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi,
>
> [Cc Jan]
>
> > Hi!
> > > > > /etc/mke2fs.conf will use 1024 block size for small filesystems, which are
> > > > > between 3M and 512M. However, on recent versions of Ubuntu, this
> > > > > configuration has changed and thet default blocksize is 4096 even for small
> > > > > filesystems.
>
> > > > > Force the blocksize to 1024 on ext3 and ext4 filesystems, which will lead
> > > > > to the expected results, as journals will take only 1M.
>
> > > > IMHO it'd be better to keep the default, because that covers what end users
> > > > actually use.
>
> > > One alternative to forcing the block size is accouting for the journal blocks,
> > > but, then, that needs to consider the block size. I think my approach is more
> > > simple. We could restrict it to the smaller 16M filesystem, though.
>
> > > What do you think?
>
> > I guess that we should merge your fix in order to have the test working
> > for the upcomming release. Then we can discuss if this should be fixed
> > differently or not.
> Acked-by: Petr Vorel <pvorel@suse.cz>

Fine by me (I don't have a better idea atm.)

>
> Kind regards,
> Petr
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
