Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFA178BA6
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 08:45:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D6613C6619
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 08:45:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 40D583C65E1
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 08:45:08 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7C58420129A
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 08:45:07 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id g6so662072plt.2
 for <ltp@lists.linux.it>; Tue, 03 Mar 2020 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=34S5CIT4H3hXtpJsR6D3gtNVVdo8ZN0z11PUEc1WQLU=;
 b=nZ/YhYdUjOuVJMQcNbPScZczbAdsLPOcyNnZGR1CKapaIejLTz306qQMDs+Vd6tmZY
 YTrzvJ9OxoGDJ3PGt3pnzTcTb1OjOthQUCcOoAfmC96PUsF5NDGnyFqjCikxugmFx346
 Oa5lKcyAXS9QufUXZlCpVwOcyzQvfiAyJpqgA+Z/drZjQur6yuWCPNntrQayRcDHNpsn
 RvSYMky9+2JzJXUJV8TYi08GkcNGtbudHOugKgC6WyhtSouhots5fIsYvLqZjuPTtQPX
 /xAEy2bBvdMcyRZmTzRAvYHZanOA2TvPdKQzgfTkadARyAIacqG7padRRAt4K7fO7poh
 1GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=34S5CIT4H3hXtpJsR6D3gtNVVdo8ZN0z11PUEc1WQLU=;
 b=F5cF5F+ujtrobJWaM/zmkbvQSMLal9/6GrPtaAZtdm0yobtEu9Mft37zdNEKZY0JR1
 B0vniCFuzU0JnQ8Q5fp9jKTDSQtsBOk0tbjg3SNLUtJ3YyHGnnsxP4A+z9gNJDID8Feg
 iOYgdPUJSrUTwpNZn6mcxJuitX7eLtr1lBeFJosApM6jLOZuJb9ffOAeXdcNGjKfi/cC
 QoMz+oPKn3Aa4l4bBjN8RfMHwlvJvKk33U2itKWCCuGEP5X0ifqJF1tSK4AvbYUrCrIQ
 5d1D6EmLszzi6htH4O0y6gOpJIua5v4SGXZXqZ9Bdzy4rFdGLIa7VP9roJaKB2mR34EW
 hLUw==
X-Gm-Message-State: ANhLgQ0uHJ9RHXUD6hw5PJdMFs1XtFJCeT0oIIRqcvTIIGT8Vc5z+MPi
 GAyIozAck53UG3sUDy1GSK4O+w==
X-Google-Smtp-Source: ADFU+vvpMVqloTaBNBF8cg/c8oRwdikxHoM94wHaTFYOsQQFifCwOTMfwzg3R896REKAQI1WJkTWfw==
X-Received: by 2002:a17:90b:1254:: with SMTP id
 gx20mr1684508pjb.185.1583307905545; 
 Tue, 03 Mar 2020 23:45:05 -0800 (PST)
Received: from localhost ([122.167.24.230])
 by smtp.gmail.com with ESMTPSA id s123sm23691250pfs.21.2020.03.03.23.45.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Mar 2020 23:45:04 -0800 (PST)
Date: Wed, 4 Mar 2020 13:15:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200304074502.i5zpf5q4gxcz2vz5@vireshk-i7>
References: <CAKohponuu3zpsQCv0v1_Yqb_tmqy5yyUejMoS1_M_UFf5FU2Mw@mail.gmail.com>
 <20200228085859.GA31181@rei>
 <20200228102432.3kdhl4aqkla4akss@vireshk-i7>
 <20200228114801.GA8324@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228114801.GA8324@rei>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Query: Adding support for clone3()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 28-02-20, 12:48, Cyril Hrubis wrote:
> That depends I guess mostly on the clone() flags, right? Unless we pass
> CLONE_VM the child lives in a separate copy of the memory space and we
> do not have to do anything about the stack.
> 
> So for the most clone3() tests we can just need the struct clone_args
> and the syscall number and we can treat it mostly like more complex
> version of fork(), i.e. pass NULL and 0 for the stack and stack_size
> parameters.
> 
> So I would start by adding the kernel version of the clone3() syscall,
> the structure, and the V0 structure size into the lapi header and use
> that for a basic testcases.

Okay, so you are suggesting here to create a separate
testcases/kernel/syscalls/clone3 directory for the tests ? That makes
sense as a user may want to test both clone and clone3 on a platform
for a given kernel version.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
