Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id 319B1163F48
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:34:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 157AE3C2627
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:34:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1C51B3C244B
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:34:52 +0100 (CET)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 025E360106D
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:34:52 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id 2so12130390pfg.12
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 00:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jZKhZOUZ7VazQqazKAcyz8V77BL019UOa77SbakEpBU=;
 b=HS5eQpKqM1NVXbNacSqaYX5hRk40Hz/m9BFzkAivG8x8RoR7L2OF5ZvVInLnhycVI4
 HDtCwGjTiDtmoWu9IrfpbXMjA5SbkWan9PpyBCrpJ/hTz9utQsOzlAXvmH/uPkYpgMuk
 qgKXHbJmPrAGaQkX+6hup4ygY8DH4z3Xb+v9aJO7YWDjD74Xv9/1ZgirqrY6bbsY5YxC
 OJ0N42rGRJtH7PFxX+t30gUvjg+9Ld4BbnG6kqnFk4sGfu+EMP91JDYioygLKOjJet/9
 wz73q5N+V46B9/l7Gh2rCPZczsRjsIUj2zleve5eliDRV6lSPiRjKbquA70vdzl/mKNc
 RmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jZKhZOUZ7VazQqazKAcyz8V77BL019UOa77SbakEpBU=;
 b=c224BRVPasqYhIt6Jr/B6wwahCk1fVJi56YwEdhBItC5xBUkGkVOE2gTSTx3aFEW/I
 jawsUTitP3d+VXK/7Kctv0uBDDAhinhYVoSTOcnlMNlvV9GHYPexswLCxopOm4S01A5q
 yckZtIRhznkZjBRx9nOrRvOefTBgxHDwqR934m5preGD9TNSBaGp9Yw5fjx1Av4b+POl
 cHSHwCft6+FAKIVNVzk4ZHXfcdomFv0ssGM5ZNSqE4CKYg2h0aRlrqvf337zXDc/fwul
 7eVjlxFqLiSjNIZaKzGVBNWHwVfVhv+RejWH6oUlgwk2Mvry0/JcKCqORFPvFtRWpB5m
 Z4Tg==
X-Gm-Message-State: APjAAAWaDxlS6L+cKp0wyqgsRaZUii0X94gGPcM6qsK0A6yF+uclNms5
 y0zCFHBTmCOpmRa/pZ9l3y22HQ==
X-Google-Smtp-Source: APXvYqyNdNVS8TuZN6RZ2WU9z6PCDAbLyyKeMB8fUxYTDsMRzLvkmMuD3WIrzTZkTaXruZc0ISLd4A==
X-Received: by 2002:a62:6409:: with SMTP id y9mr25907552pfb.30.1582101290690; 
 Wed, 19 Feb 2020 00:34:50 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id x21sm1751688pfq.76.2020.02.19.00.34.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 00:34:50 -0800 (PST)
Date: Wed, 19 Feb 2020 14:04:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200219083448.miwubkndnbxq3awn@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
 <20200217133638.GB14410@rei>
 <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
 <20200219082359.GA21099@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219082359.GA21099@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-02-20, 09:23, Petr Vorel wrote:
> Hi Viresh,
> 
> as somebody (probably Li) pointed out fsopen/fsopen01.c is similar to fsmount/fsmount01.c,
> so please during rebase drop it. BTW for this dropped test I'd use different
> approach (close fd in cleanup function and use tst_brk(TFAIL instead of
> tst_res(TBROK and goto):
> 
> static void cleanup(void)
> {
> 	if (fd > 0)
> 		SAFE_CLOSE(fd);
> }
> 
> ...
> 	if (fd == -1)
> 		tst_brk(TFAIL | TERRNO, "fsopen() failed");

Lets review this comment after my V2 series is posted today. It may be better to
keep separate tests.

> Also you added autotools check for functions (e.g. fsopen) during commits, but I
> move them to the first (together with lapi header).

Yeah, I already saw that. Thanks for that, you did the right thing :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
