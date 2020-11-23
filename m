Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF992BFFB8
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 06:52:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C13F3C4E90
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 06:52:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 994FB3C2912
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 06:52:08 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A7B0C1000A8C
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 06:52:07 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id m9so13236583pgb.4
 for <ltp@lists.linux.it>; Sun, 22 Nov 2020 21:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SAdRt5ApkBxG1gHUPLvA5lQtSn+Dd31/fVXwTUVvKP4=;
 b=HMwiFFlI3KE2FQF+ZvfI+lmy8aNeviP+0n4k3wi+VO1+uAs6bfhmzsMrg6GxecN+cC
 HtTT0u2cILiac569UPSQ5B2dChhEaYIH08zMIkVdsTEPtiH/pouSWt1OI7iQZiQNDr9/
 nzWjALFZ6C4JmPlHIQWw06bQFJ2T8pXlAVbWBL6p24NN29MgNpbs0HLnUfp+0fagz7EI
 S7uT8/Yi4yxFw7V2ud/No0En/j44kXikS9Tn1//5RJ1Fpb3zNtVNIwvvywzR4u0lZceY
 Zgv60yjOWWb+7WDHD92Txn5nq6LPdOV6ro7qXIGrrUbZdXQ6awbvK08j6uCBpTmzOL4q
 WQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SAdRt5ApkBxG1gHUPLvA5lQtSn+Dd31/fVXwTUVvKP4=;
 b=JrVik5gKDd5R8hlzBP3xYfNA+Q8xooBLjpo6VWjwlQNCQtg0v0qEFobd+qQCWkgABi
 kd8QoYBSXMrL8TW4YNDU1m0LQWp9j2qTPQPypwKMN6TzixJd/ijExlu8m2u14BUBbUtr
 7+A4ooticZZ1UzfXNp5xwd7phXzRWZJGdRxX6ca47z7W5SX+FQDkU7gI5lNYdrnbO2JY
 QTOgWDiDi2TC5cKkFB6MuwZFcEbazPVj4lLn04XakdoM3xrFDrCnoUf2OjSBufk0I1wQ
 Y8WP+xkmkfWAE9gA6P5rJ/OYRqFjBCJ+pf5Wc7AZDU/Vz12mJ2DUFZB1BmB+nYDzAme6
 bm0A==
X-Gm-Message-State: AOAM532qeG8gefMSuebGw7RjDLqE5skZAil7CIBHwIj7yVhdpHHiQTer
 sEWM11lasaqwyKULXGzW7+3seA==
X-Google-Smtp-Source: ABdhPJzaltvXljr1WYFiY7CiU8A8isPk61yRTZraMr+mBdOz3xRxY05LcYmat1qdOIitDHd8FPZNHw==
X-Received: by 2002:aa7:9387:0:b029:18b:42dd:41c with SMTP id
 t7-20020aa793870000b029018b42dd041cmr23116522pfe.60.1606110725727; 
 Sun, 22 Nov 2020 21:52:05 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id t21sm12465524pjr.42.2020.11.22.21.52.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Nov 2020 21:52:05 -0800 (PST)
Date: Mon, 23 Nov 2020 11:22:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201123055201.tvouwhjydn46jjps@vireshk-i7>
References: <9c4453f49394a7864ec9c84ccd561663f54bae51.1605862411.git.viresh.kumar@linaro.org>
 <20201120104105.GB4910@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120104105.GB4910@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Add tests for name_to_handle_at() and
 open_by_handle_at()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 20-11-20, 11:41, Cyril Hrubis wrote:
> We does not seem to use it in any way, I guess that we should add
> fallback definitions to a lapi header in the same way we do for example
> in lapi/setns.h so that these tests would compile on older libcs.

These syscalls were added long back in 2.6.38 and so I stayed away
from adding a header and userspace (where we care) must already have
the definitions. Should I add that header ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
