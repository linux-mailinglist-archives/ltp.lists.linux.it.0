Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA519186F
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 19:07:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C24033C4D51
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 19:07:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 65FB23C4D38
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 19:07:43 +0100 (CET)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EE5D510014BC
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 19:07:42 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id 26so3115030wmk.1
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=1YjHLV4nevUjQn3lGIpg0qDvlA2W2DeYRHLd3khm0DU=;
 b=L0jZCUYrPA0BTciCNkoQTw2SowE73GXCTKM/Dyslp+Jr9qzrtXndgqBThuMCbEsHsp
 Vp3sproad1zq/SEGZe7Lm/nuftVx7BZZDr6/bS92LbF+IPbGCjZf5naRLn/Bpeb9qPje
 vucC+VQ/1wVABJEI0BTQjR7j/NvutI8xhUWKIBLy8PN+Disg5FhTSaaoVnc/viyH9esu
 q4PI/ldW50C2NIZyQZ8MDzMlzGis+5zcMYIBzjwTssLoNDJBL7ndmAaN5JWXDVYbh9A/
 sW7qkrWaJQ+v/0FqJZL+8d7yBm41ghO1T52e9dC2T7XsHAtj+meJ9+rZ9LsYMnVnzA8S
 1jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=1YjHLV4nevUjQn3lGIpg0qDvlA2W2DeYRHLd3khm0DU=;
 b=Wm9ASnbxloJG6urSjNb+zvUirjGmTnMHrZWTs1eNYI+OV09wSKzS/agdPlZWsQ5cUM
 mXxdFqM8kGZaWW2IuDyfUWD8YdShM6XGjhRYh8mpyPAJSx3sWKCuJ0YWR9ywOzi2TMHl
 nt5Y1M3/XMosnFe0D0ig2csXdS7HZe6SGxFyCVfsLAGxcDBVcSV1brdg59wZQjiuumEF
 vpXoHoPpv5Qqn207JWh6xYy2cLXzCwwTqADOMKcD/7yFvCEgN7a60AUrRWh/g+HEGZW9
 rhjkzumgXxI1jIEMmgtxeecybALrYb4BCexDPscQ+NIAGnmYMonMXXFoUVAlWwsvCRM2
 omdA==
X-Gm-Message-State: ANhLgQ2NhfJdd7GfLjoGUjucTRAcdH1zt2a3KYUruia1BRa2JOFgz0Ac
 3+v/d45h+hwT3oltjWHFWF0=
X-Google-Smtp-Source: ADFU+vt6It1Tr1tZxqrF6oSSeTYXUvrzzqD2zGLc1U7LBUAiFky5itJPi5AmL9aEGYbwkgcjoQPuOg==
X-Received: by 2002:a1c:e913:: with SMTP id q19mr7271902wmc.31.1585073262473; 
 Tue, 24 Mar 2020 11:07:42 -0700 (PDT)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z21sm5230951wmf.28.2020.03.24.11.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 11:07:41 -0700 (PDT)
Date: Tue, 24 Mar 2020 19:07:39 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200324180739.GB1209868@x230>
References: <20200323224933.2613658-1-petr.vorel@gmail.com>
 <20200324233550.GA4521@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324233550.GA4521@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] accept4: Use tst_variant
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

Hi Cyril,

> > @@ -51,11 +51,7 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
> >  	args[3] = flags;

> >  	return tst_syscall(__NR_socketcall, SYS_ACCEPT4, args);
> > -#else
> > -	return tst_syscall(__NR_accept4, fd, sockaddr, addrlen, flags);
> > -#endif
> >  }
> > -#endif

> This is very minor, however the function should be renamed to something
> as socketcall_accept4().

> Acked otherwise.

Thanks, patchset pushed with this fix.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
