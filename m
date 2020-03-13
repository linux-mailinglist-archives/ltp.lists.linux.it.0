Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81C184000
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:19:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C33253C5ED4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:19:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B3BA53C5E69
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:19:52 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C92A92005DD
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:19:51 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id h8so4201898pgs.9
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 21:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Os/q0y5aF+q6HnN5qSIWixdh2c0s4uJm2IVzTz5QMRc=;
 b=ivm7+oTm5rw8+Mk4R1Kc2pqAiMgY/uHXFSyVrYI7ZwUDx98TZo2D+2bOJZFVWnjEsM
 8cIz0LXK/d2cVmf/L4sm0MSJAQ8500ukMqoVNeaDZp92y6uWPx2S6CLRo1ldN1e9bNDM
 5uDZjaI3ZbEWk+4EuBjOxz7F7mULT53RV8x+9ZO0FkQ2X4CXm55F5vmVmtGLJbYYeguy
 r9yPoE4zqg7l3SLoa9DxxuvhKDbY+K0R24rZXGlUgaMxtTj8/u1R6lF6Oj7aCFYDuUrf
 XBt0bCb34rpz9eYDyOohk6ZUaFyweeu88tpFXGS1XOX+JKqhJ334WnFCHpEwWDV/pY5q
 keGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Os/q0y5aF+q6HnN5qSIWixdh2c0s4uJm2IVzTz5QMRc=;
 b=f4PQfQxebBOVtq2ddnDAfFWCSXeHTS3Crt24S4ZnOOEMy5jjJCVKUt/3vh1Kll9qPh
 Ic0Asis4V3mij+J3l2GrZ1Ld4MezcS6ciEbIxx+rW2lN9E+XXtZzBOG5anMvWI9s3l06
 1zFWuRAQC7Q5l9u6Znu362Hr3SR27V7wdWc0uhIWTaoZwYZBhJLG676MPDKTiK7RFqhO
 9pbk/OT5AyGBbcGcXmWySPB+uZSyMJehcaNvoMuOnqjtUj0wQikde54P6DH42OCAM6YP
 1A4EhzwtPzmzx1iLhUuVjrj52bFJUcnVJbYnxrrUm0dDidqYCL//k6i/hmEsO5QwPjxI
 TNzg==
X-Gm-Message-State: ANhLgQ26voDdGjWJdlY5LDutKDQ5nSQugbD55WPQ6dV8IeDc7LTuqKgX
 O8AqFsYWZs6awMg7p8fBFuv8JQ==
X-Google-Smtp-Source: ADFU+vu50ZXVc6VeKAYS7npPdbShVgAITT//Txqaz12Xn2gyCzKZYo3kukBPjJULPSH43ENt3/92fQ==
X-Received: by 2002:a63:8b41:: with SMTP id j62mr10699627pge.18.1584073190276; 
 Thu, 12 Mar 2020 21:19:50 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id i187sm16424731pfg.33.2020.03.12.21.19.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 21:19:49 -0700 (PDT)
Date: Fri, 13 Mar 2020 09:49:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200313041947.2ua6abqerhdo6wfv@vireshk-i7>
References: <08f6f9f8af7b8f999136cc2a30744a8d678d2b5f.1584000268.git.viresh.kumar@linaro.org>
 <20200312134300.GB3803@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312134300.GB3803@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clone3: New tests
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

On 12-03-20, 14:43, Cyril Hrubis wrote:
> Also all pidfd, child_tid, and parent_tid should be tested with invalid
> pointers right?

I tried this but here is the problem ..

- pidfd: Kernel doesn't check this pointer and we get EFAULT.
- child_tid: Kernel checks for valid pointer and doesn't use the
  variable if NULL, so test passes unexpectedly.
- parent_tid: Kernel doesn't verify the pointer, but doesn't return
  the error code properly and so test passes unexpectedly.

And so I wasn't sure on what we should be doing really.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
