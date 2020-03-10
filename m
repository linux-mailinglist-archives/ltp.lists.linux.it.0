Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E692617EEE0
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:54:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F3C33C6168
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:54:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5868F3C613B
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:54:41 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 37B0A10005B9
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:54:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583808879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YI6iInuoNLZcsMqK+QUYnsYHDfK0NncsAefxDQShDK8=;
 b=NrBPgvZ7f0dcIaIkSOOVIpl42d1X4yJdMJ7j32nSAjz8KdO9L2tzGGlJXl7ES+PGGsVigf
 zAJhiMDhbLTNp+KhiXdI9zi0KMaMXSlCmEeC1vxMhsEeNfX1T6kv39uo7M3ier5g0wYEP0
 P3tlvjxID1kn+tSlFUn07S+7SRJcono=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-lD_IYklNNuyqYnIzLTrz9Q-1; Mon, 09 Mar 2020 22:54:37 -0400
X-MC-Unique: lD_IYklNNuyqYnIzLTrz9Q-1
Received: by mail-lf1-f72.google.com with SMTP id b185so2151448lfd.1
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 19:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9x82ubsV7VDhuc4MUPLnFgn8+4P98EKDIY0fQZ6Xbo=;
 b=sZHOSgoO9CqlfFqcVodJbve1+8q0y0G324PxzSkc1SlIwixQkxKGztpAoU6RbzlRHP
 qFbg2k2r/lcWXFcL01YWeEwDUYGKNZXGsG5/iLz3F7KhlvJzC5nmVciXMLlSs//TOud9
 TY8plekDJXET/PBgpuRQsi6le8n6R9OEUNwC37b2BQQ+9ySECtcZwLAB+sobOR6nEKtZ
 WHshrQdv1uZ7p6+yXQ+5/EA2+4nUcGJlxtpGGh9gBVcY4JwlpfJz+sgE/r3ohGSStP7W
 AyyH5A8YiJreGIgmnbEblZeOGcNvX9XdkrO+FfFJsxVaJHFaI8BPLQ9dGfKRpNlfxomU
 zXtQ==
X-Gm-Message-State: ANhLgQ3kfODXasaE8gzoZvgxV5VDrZQ60/IDRdzAXmazL8YG3hInA3mX
 MZhBD7WBXvrbQQyE/FfFHfn4chZWlVYimmNGxKCQ3rsjZKKpLkVTWyiWuhGS+1TxhjZbd4t0Pzi
 t9HiOh8TgPLOqP9YsszxlkGnNOHo=
X-Received: by 2002:a2e:a312:: with SMTP id l18mr2722943lje.229.1583808876131; 
 Mon, 09 Mar 2020 19:54:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs34C/CGgj7T+hR239tiSn+AZBPeEnpsbftJpzHpuYUSqADbY/wDUInmrknkwLym9wecnYBn9zC1IqHv9f74rY=
X-Received: by 2002:a2e:a312:: with SMTP id l18mr2722936lje.229.1583808875955; 
 Mon, 09 Mar 2020 19:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
 <7adf2e52-6960-584f-bef4-c0179ade342a@cn.fujitsu.com>
In-Reply-To: <7adf2e52-6960-584f-bef4-c0179ade342a@cn.fujitsu.com>
From: Ronald Monthero <rmonther@redhat.com>
Date: Tue, 10 Mar 2020 12:54:24 +1000
Message-ID: <CAGR3Yi6zV9hLhaY+kKRHZYByo-Vtc_MvqEdTEOXjbnHK6tFR6w@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Fix build error because of undefined CAP_SYS_TIME
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

Sure thanks

Regards,
Ronald

On Tue, Mar 10, 2020 at 12:51 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Hi Ronald
>
> acked, but I think we can sort them by num.
>
> @xiao, can you merge this patch?
>
> Best Regards
> Yang Xu
>
> > Details of the build log at pr#654
> > https://github.com/linux-test-project/ltp/pull/654
> >
> > Signed-off-by: Ronald Monthero <rmonther@redhat.com
> > <mailto:rmonther@redhat.com>>
> > ---
> > diff --git a/include/lapi/capability.h b/include/lapi/capability.h
> > index 8833f0605..8ed68bfce 100644
> > --- a/include/lapi/capability.h
> > +++ b/include/lapi/capability.h
> > @@ -24,6 +24,10 @@
> >   # define CAP_NET_RAW          13
> >   #endif
> >
> > +#ifndef CAP_SYS_TIME
> > +#define CAP_SYS_TIME          25
> > +#endif
> > +
> >   #ifndef CAP_SYS_ADMIN
> >   # define CAP_SYS_ADMIN        21
> >   #endif
> > ---
> >
> >
>
>


-- 
Regards,
Ronald


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
