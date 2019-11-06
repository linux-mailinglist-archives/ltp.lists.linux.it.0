Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F561F1DB8
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 19:44:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54EAB3C23F3
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 19:44:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B21263C23BB
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 19:44:35 +0100 (CET)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0DC76006D7
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 19:44:34 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id 8so4727856wmo.0
 for <ltp@lists.linux.it>; Wed, 06 Nov 2019 10:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sAMcMGI+062+82hShWvpVY/+uEP++u3Ufd0kNtNw3eY=;
 b=DLsV9UqMInZX0EynfRLI4LqiFoebCQ4coSFnTR00wTGtLXQ+rQYc5lB+vzDxQlKRKU
 g5xyS0N+aonxB3D9rpCN5Wg/lAYdmK6Zg8DKlUmyC4hdSiW4WRYiB4BcfKZTDsFM3f+/
 bFNe4a4QwNE0kjMCUnwAWbm+AKHDZmq2iylduwRAmapWp3KQIKBEUhUuFIzxVvK6sL+9
 JA+H5ZzZ8ENeyFGlvPrVgZgLYSagrPsjL5aOLm/cqsJUHTGkcLobJ0TfwhcALOG/pFHT
 SHibCSCG0GMHq4S4gX+gxPtnzPTzG3VUpEQrPKn8AR160cT6z3clkCs5mG8uljRWx6Xb
 jehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=sAMcMGI+062+82hShWvpVY/+uEP++u3Ufd0kNtNw3eY=;
 b=Vnx+mShDQHBUztHgPnUTU3rnF2jvjW/L0K3e5CAGNj+0m8yKLQYq/KfmWc4NjYC6e4
 sAzwPWxQd0A/MJ91dVe2UWc6NEtY1EJF0gLg1FIFG8XW29SZFPS4UMKT+KJiXRcluI0K
 27PVrKgslxiAqZeHKkFjHVCHobFAkMxhCqE5A9lSid20MsR5gyuGKd9ybqi5J7VP3+6X
 6qBm8e1DxyKtLn9SEVPQzPNM6WRtEJCRFd5AnLCfjDQknmrpR/lwMmrrfLJOotB0U5+Z
 FuR76mwdVJfNNz4DT66aQCSE5v+IiAAMSGsplAXpB+9yZk7QNMKiXnJQiA4Q1SgmxF76
 Zp1Q==
X-Gm-Message-State: APjAAAWWSX8X33kKaJQktOet8pjVUfqdfl3bhU9qo4dhG4zhchpXsuRY
 PJZWuXxDGMTtLkKwovrx13c=
X-Google-Smtp-Source: APXvYqzil3ZiZFKi47GllTEvOMZamYJzZuI9iLdWmEYGquvHma9Te7gPo9jExaz6qetDeVLHUgEi8w==
X-Received: by 2002:a1c:8189:: with SMTP id c131mr3836503wmd.151.1573065874569; 
 Wed, 06 Nov 2019 10:44:34 -0800 (PST)
Received: from x230 ([178.21.189.11])
 by smtp.gmail.com with ESMTPSA id k4sm3763314wmk.26.2019.11.06.10.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 10:44:33 -0800 (PST)
Date: Wed, 6 Nov 2019 19:44:32 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191106184432.GB25671@x230>
References: <20191105005341.19033-1-petr.vorel@gmail.com>
 <20191105005341.19033-3-petr.vorel@gmail.com>
 <1570001833.10536641.1572959481303.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570001833.10536641.1572959481303.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fanotify: Rename fanotify_event_info_fid
 struct
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> ----- Original Message -----
> > --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> > @@ -133,17 +133,15 @@ struct fanotify_event_info_header {
> >  	uint8_t pad;
> >  	uint16_t len;
> >  };
> > +#endif /* ! FAN_REPORT_FID */

> >  #ifdef HAVE_NAME_TO_HANDLE_AT
> > -struct fanotify_event_info_fid {
> > +struct lapi_fanotify_event_info_fid {
> >  	struct fanotify_event_info_header hdr;
> >  	__kernel_fsid_t fsid;
> >  	unsigned char handle[0];
> >  };

> I think I see what you mean by "mixing glibc/lapi/kernel types".
> This structure could be combination of various types and now it's
> used even if sys/fanotify.h provides one.

> As alternative idea, we could add some accessor macro for that 'val' field.
> On musl macro would return '__val', and elsewhere 'val'.

Sure, I can do the detection, probably with autotools detection
(although that macro could be defined without it, but current state can change).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
