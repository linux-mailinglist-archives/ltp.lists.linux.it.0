Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B7AC0E45
	for <lists+linux-ltp@lfdr.de>; Thu, 22 May 2025 16:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1747924610; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Zlzc22jLdI2Hm1B1705J3wV9Sk92GC+Yn+wxdtuZ+T8=;
 b=EoGfKpnSIeQv1BEyTIANfQWTYiLUW2VmMOt+hZCIlRgCe4FPT2ZpB0cgUU5PZd5mEYv2W
 Ezjd+o0LDfByhOzEM9xz8RSaZonllOqVaCqk3tY+HegXJto6z42UVBU4/wrYGuO3VFulmJW
 JZTPnVkk78cLEK/URpWWMX7Z0KymrdA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1407A3CC869
	for <lists+linux-ltp@lfdr.de>; Thu, 22 May 2025 16:36:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 838D73C0880
 for <ltp@lists.linux.it>; Thu, 22 May 2025 16:36:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 928DF600567
 for <ltp@lists.linux.it>; Thu, 22 May 2025 16:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747924590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFZ46KafMHzhebWhbuTRdfMVMmLuWDQmhl3O/HFkZe0=;
 b=h5Uf2KTs1/CuUUnoDD2e3ghznSkVdBRYsjs2AJsXBMZqgdImi6inn2dnHs5pl6cecerdS/
 rNQrNvaZf1t5Lyf3fADW23o4bs7e5WyphYZO+Lw9+tyYafoP9Sc+cZwnqQ1tp1iozn/inI
 4xwKU+gzghBSCoNNi/c5+7FjU2NuM8o=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-1qLHHJRRPtum480e0EtQuQ-1; Thu, 22 May 2025 10:36:29 -0400
X-MC-Unique: 1qLHHJRRPtum480e0EtQuQ-1
X-Mimecast-MFC-AGG-ID: 1qLHHJRRPtum480e0EtQuQ_1747924588
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-231e76f6eafso55689045ad.0
 for <ltp@lists.linux.it>; Thu, 22 May 2025 07:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747924588; x=1748529388;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YFZ46KafMHzhebWhbuTRdfMVMmLuWDQmhl3O/HFkZe0=;
 b=hHO7GFLQsT5c2WXahflWApiRx2K5ayoBxI1xcTgfJ9OlFfaXzozTdgHHDdmYAqcEiY
 pQrZQSGQOuBmr/fYmE5jQp2of+H8ccADp/lPF1hRi9JlWU8ovUotO4LMoJG0w54zHppd
 t8+dJlI1Olx53rIKWtV10J+HUuqihBDM8xZ03xAeNyUJPF3ApM3kWAVCBTbt2CPbwfjF
 CgiLMPd5/Wlt5i1a/kaaFvleYyMwvyrujFIoE3khydTModY/3KlhKw4QEPpZvnc3obr4
 H/uwZBWPcx8w74yzRlxs/hThXKDy4JclpH4cQLtlpgR3/UlfZd1SxQh5wygN9F+uV2Ig
 TV/w==
X-Gm-Message-State: AOJu0YwINwwSfxefUb0YitGro1Fs6U1xDcMk785SXcWm4KFr4P0EeJbc
 g1GuDBjm6PT1XISJTCyUwrxC9JJ9iCcVhEWDgFthzqAT31/Y5iJbwau2eId5ozpFZNZqLxQtJT5
 H6CYPYRcvwX9hgH4WCkhDcWXQuoNP68lcW8qn5+KSUPuV1uPZLNZGuawFjyQGGvclB/TwAsZ936
 UP391/HtOjWy/frQAmZylqfjXhLTA=
X-Gm-Gg: ASbGncs1OoUrr6IOf69HEJoUrgV8RGNvmRZBpU7jCWurnL1XKTHekawvQfyXgaHQCBj
 Ovhr7GEawURbGK+sAT97CEQ3JgP96mFV+EaZkVYIaECXZ0Ya7JUklICwkFqpoPODF6Yiq6Q==
X-Received: by 2002:a17:902:ce87:b0:215:b473:1dc9 with SMTP id
 d9443c01a7336-231de37ed18mr315160865ad.46.1747924588335; 
 Thu, 22 May 2025 07:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyvHy6nYtXG9nb+pI2b9VHKvuZGF2kv0HctHbWaSiOtvLsJHWCCfPYBCOY8iI3+/7lyb0/mRWyxmDgRvALpLw=
X-Received: by 2002:a17:902:ce87:b0:215:b473:1dc9 with SMTP id
 d9443c01a7336-231de37ed18mr315160575ad.46.1747924587970; Thu, 22 May 2025
 07:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250520202429.577890-1-luizcap@redhat.com>
 <CAEemH2cdN6mcYJk06ksp7nyzz5qOmmRM=sR_SAqLtquD=8ya3g@mail.gmail.com>
 <ae7ee313-21f4-4f82-b522-4028947c8a1c@redhat.com>
 <CAEemH2dccNNvuEE_GNLxd3eR1_uiVX+UhmFBaNXTPU7sRYg29w@mail.gmail.com>
 <CAEemH2f33e0287pfngF+dczQ_AS0Yvt6YxNQOnrpSGHuqODRbQ@mail.gmail.com>
 <72dcba43-6d27-40e9-a110-3db7990e58d1@redhat.com>
In-Reply-To: <72dcba43-6d27-40e9-a110-3db7990e58d1@redhat.com>
Date: Thu, 22 May 2025 22:36:15 +0800
X-Gm-Features: AX0GCFsN-AKnu1vqt32ItKT7vo2cnutG_F7Km9jt0iPTvq2e3Kn8cfUPwqkwWro
Message-ID: <CAEemH2dx1HFd1jxjtujA3JHAQBER4RrW_xiW0tS5xb5M2pkhiw@mail.gmail.com>
To: Luiz Capitulino <luizcap@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mE4GdMyAeOlKWw5JLCENrpj5DEGV9F77dSJbMj1JjWw_1747924588
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SPF_TEMPERROR
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] ksm: fix segfault on s390
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Luiz Capitulino <luizcap@redhat.com> wrote:

> > I might be a bit too picky:). So I compared the two approaches on a
> > 2 CPUs, KVM, x86_64 system:
> >
> > Per-block checking cost time:
> >     real 0m5.862s
> >     user 0m1.098s
> >     sys 0m1.505s
> >
> > Per-byte checking cost time:
> >    real    0m6.819s
> >    user    0m2.498s
> >    sys     0m1.495s
> >
> >  From the data, block-by-block checking can reduce the total execution
> > time by about 14% and reduce CPU usage by more than 35%, especially
> > in user-space calculations. This number may not be large, but considering
> > that tests are frequently run in CI, I think it would be a good thing if we can
> > reduce 1 second each time :).
>
> Just to make sure I understand: you measured total test run-time, correct?
> How many times did you run it?
>
> In any case, I'm not sure a 1 second run-time (or even CPU utilization) matters
> that much. You're running test code, you shouldn't expect otherwise unless you
> hit a very bad case (say something taking several hours to complete).
>
> The trade off is more complex code with bugs that can hide for 10+ years and
> take developer time to debug. Also, higher memory utilization: 's' doubles
> memory utilization per child only to do that check.

Ture, that's why the problem not been find so many years!

>
> So, I suggest we stick to the simpler code. Or, get it merged now (since it's
> fixing a bug and possibly making the code _faster_) and then you can optimize
> on top later if you like.

Ok, sounds reasonable.

Reviewed-by: Li Wang <liwang@redhat.com>

@Cyril, @Petr, I vote to merge this one (as it is) before our May release.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
