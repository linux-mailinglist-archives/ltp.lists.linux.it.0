Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 807DB17EF01
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 04:15:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8E0F3C6193
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 04:15:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AC5BA3C60EE
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 04:15:36 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 36AFF2001A7
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 04:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583810134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPQjozajrmTGxspvTJ8/HW+dSP1I4UYf/Y8+D56KGuo=;
 b=Bo0BSNWfPU/ICL6xhPOnFaus05rYM25vjRwinIso/AQTBe99h56LSmMFoN/i5b7qkFj7EX
 feMnZuOFjhEO4EuGfj1nTRa+oQHna8dklHqK43jcuJe6J9uSY8V3AAMa+HXpigUZcp9iGA
 SoJDuHaM4GMOEQqEv1P6wWEJRXl8F+s=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-O6HVtotENDGx2w_X4IW0lw-1; Mon, 09 Mar 2020 23:15:32 -0400
X-MC-Unique: O6HVtotENDGx2w_X4IW0lw-1
Received: by mail-lj1-f198.google.com with SMTP id c12so1746285ljj.12
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 20:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIf8ENNbbBgr2amXFUxAoM83uSpc38QaDyYytWBVAXI=;
 b=J2WSCTTOZri1ToKppqTqll8UhEmh8t1qE/hVelujATO9Ehkcu8o6AAH73P7AYhxmeI
 4ZEnDId1s/1+CN2JOjtl9soAMetL+jSTH9w2tl76PDkE0SsTe6920Zn2k99KGHexuzXY
 ma7mvxI3tOtUQz6P1UwW0TzeDWi5utrfkDFn0GAyJ6sEiMBy/CeLBWbBrD0obFPMR5Ec
 Vd+UpooT0hOtwBROSzUFHy2AwbA6YbSO+rpaGEBRSuRqa0fogVyanFIqUf4EViLvWu9N
 mXK8mGgsRNs4aFeasohVmsWYbI90lzWh091msscbnOFK6DYItEuePuX8WO7j+9GUWtMF
 R3NA==
X-Gm-Message-State: ANhLgQ2sGJVlQxPS+P+sfx1iE/Wd+8EfcwCYLZ4Npyhw6Lvde6FGdFGV
 bWOJW4woAxea0Xc6j3Ph+Mh1RT3HwRfrX8iJzHRNYUjX9sbhUoE3HrEHG1ddIUD72HsEM+g8wwy
 uCatP9NyaVRS4HgaXb9yVQm6OmQY=
X-Received: by 2002:a05:651c:545:: with SMTP id
 q5mr11071410ljp.139.1583810130153; 
 Mon, 09 Mar 2020 20:15:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsDiIiZsI1R3cjtFzleaRXu1w4LVeND093qlYDQ8EmZePmv8LH9hN6ygHh99OhidtqPEGTUIHpDfJ+a9pFX9nA=
X-Received: by 2002:a05:651c:545:: with SMTP id
 q5mr11071402ljp.139.1583810129906; 
 Mon, 09 Mar 2020 20:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
 <7adf2e52-6960-584f-bef4-c0179ade342a@cn.fujitsu.com>
In-Reply-To: <7adf2e52-6960-584f-bef4-c0179ade342a@cn.fujitsu.com>
From: Ronald Monthero <rmonther@redhat.com>
Date: Tue, 10 Mar 2020 13:15:18 +1000
Message-ID: <CAGR3Yi4ZODNH=sLf2n-XQRvxVK=NvXFo4P8cVE3m_hAEKce-UQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

> acked, but I think we can sort them by num.
Sure sounds good to sort them.

Signed-off-by: Ronald Monthero <rmonther@redhat.com>
---
 include/lapi/capability.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 8ed68bfce..f69f27c88 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -24,14 +24,14 @@
 # define CAP_NET_RAW          13
 #endif

 #ifndef CAP_SYS_ADMIN
 # define CAP_SYS_ADMIN        21
 #endif

+#ifndef CAP_SYS_TIME
+#define CAP_SYS_TIME          25
+#endif
+
 #ifndef CAP_AUDIT_READ
 # define CAP_AUDIT_READ       37
 #endif

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
