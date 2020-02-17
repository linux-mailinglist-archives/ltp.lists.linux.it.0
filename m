Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26126160E36
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:14:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A20D03C23DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:14:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 519873C02F2
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:14:25 +0100 (CET)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 165921A0106E
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:14:25 +0100 (CET)
Received: by mail-pf1-x42e.google.com with SMTP id 2so8486685pfg.12
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KZYylImxJtFXV9H+GThrQkeJBKqdvsb7okPzNUfFC9k=;
 b=nvLJXkf1044Y8XDTgcrRmvJWzxsbUWe0yR9JRjzOwaoDL92zU6PAHwlwAbd0uo7BEV
 P00iv5uCRz8dn+ohJEjXRzA/CmISWdnJcbXQCm1xj0XyPiXMW13RLuPnsRc6BLgJ0uIS
 21A9sHFT4BcZQCbQ0nLw0eL7KwuAbnHN2Pv/ufQ+/s4sELmopDvlUxTGuCUshJpP6Buh
 k0p8f/dt4zkqD7ZoAZykvsVYnJrbQbyWFueH5WiVoWwoAIcwctrJJFvH8NvLWkrm+2bL
 xk3ok+CazpnD9EOUo4IfuemadN+5C3gypepK2X3YvvT/JEpu6YbXr6dGrCGO8rCMHtGC
 lnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KZYylImxJtFXV9H+GThrQkeJBKqdvsb7okPzNUfFC9k=;
 b=XGJ3LztIsE/rKZNg3jUeBGfEoMRuOfl8m1n0IOzcvW+OuXlHONEDnNDicc4wC0Zg5k
 uNeUEexrrYfRfGXA0HS0pnY3f0DmsYd6MDjKY2mi9YQPdJzSmWUkyGoQ9I5R7Lz5vCTy
 kNRlJtda9KxRmGSuLeoJLsfkc3Z6kGzp6iMP0VPG7tWWnVys0vMvMMSGk+hgdgXKYXOn
 P/KAfZ0fvRz/yLl2/AMKuQ85wsfHu0JE1vFFRb2iy9ioQwvcLxEtBYHLk3hnO+JVIHGh
 EXlkKDyYwWdI6lCBqjKLsUsC1Y3i8cmtfCcfpMLDHvSIDbR5/3pEfft7dhur0gRp+idm
 pHRA==
X-Gm-Message-State: APjAAAVLtlV7+hxr18Kev/pTRSR2iTKWRTT8v+Lm/7tdIOcODtfwR9T6
 6hTpxd5UyhbD8OA9vTuW7V9uwQ==
X-Google-Smtp-Source: APXvYqxKqCMsqOVd6HXOb7Px9cpZP1SeCttg4JNQwX812QqonANFSgmE32FePZTmc2Ri3JlZgQaWsQ==
X-Received: by 2002:a63:8b44:: with SMTP id j65mr16392563pge.272.1581930863517; 
 Mon, 17 Feb 2020 01:14:23 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id t66sm16241638pgb.91.2020.02.17.01.14.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 01:14:22 -0800 (PST)
Date: Mon, 17 Feb 2020 14:44:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200217091420.ktruvdu6v3fcul6u@vireshk-i7>
References: <20200217084622.11199-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217084622.11199-1-pvorel@suse.cz>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 0/4] Add test for new mount API v5.2
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

On 17-02-20, 09:46, Petr Vorel wrote:
> Hi,
> 
> hopefully the final version we can merge (so we can continue with Viresh
> Kumar tests).

Unfortunately not :(

Specially because the powerpc64 change is redundant, apart from other minor
comments provided.

Few more comments were posted few hours back by /me and Li.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
