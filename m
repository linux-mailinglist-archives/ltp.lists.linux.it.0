Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0991C5233
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:50:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8A303C5829
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:50:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A55103C57E9
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:50:45 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BF835140025A
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:50:44 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id r14so644662pfg.2
 for <ltp@lists.linux.it>; Tue, 05 May 2020 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ITlUTB3RfDPvtSOHVhuedu40GMtPs1ePhPFKzIJ8bA4=;
 b=MRUh+s8XbuoeJmd6IWc/qB4gxt2WiJETICwcicB8RWShPGUtertQ3hJ8R3axaBIfuL
 GtuNDfn9l6nwKLhs4FBT0Er/c0Hdjp0gOz8+4ERVWISHyBSxt0iEcAygojZx8zuzVKBN
 6AW0T7s55FIhW4IY7n5dQTpEfRYA9p+98CPXufJUg/eXD+13b5lbzb7cnrpK+LB6C69z
 6eNw8r5kMUI46/CfPc73oPXZhWXJZmnTma1QUUrnREd9h2j5fHkV9VvRzKYn3k47sMWb
 CCSIjuJiJHAPxpGVnmVkuPIlsEnT7T8qj0WTGH+/syoCsRig/FwEK+JKbzzp/GfNIVl7
 HI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ITlUTB3RfDPvtSOHVhuedu40GMtPs1ePhPFKzIJ8bA4=;
 b=J2nw4WJxYWDINU2vXXHdcEMSAz6ferv5cqjqL+vdWl0ju66MCkqQorhlABX4bv74lI
 rlhZ8c+U2WCo2oiO/EyPSr8X4qYxlanlAnqX8C3KCWos7XdPHda70nRPcLCd2z+4GM6k
 Gih0HAzpMhSyHWwWKtNDshQiFuJIb4XD1OZmCIKDYptxxjy6F0fDmAeQObOiH/AN6sTT
 hqnuq/DOiSWQnxg4bJ5Xbm1DRXromGlc9WK4BxeDEkt9NqIA7RdfLLidUZjgJErB4CWp
 fj4fREH+t75+shS1sr6qACmuMxL2xUyJhf+usU+7SDH0KFQFRMt2AL0I9QRjEzk2u2c9
 Y55g==
X-Gm-Message-State: AGi0PubC7tqvADQKtBZcYLT3T+auMXXZU2VbEaQ2+pwCberH5cM2f3tW
 uTWnhsOKMyFyq+l7g4Oyc72SRkCdc60=
X-Google-Smtp-Source: APiQypKDI+IJ5mxozGJHeOpSIwlrHMJ/bfC2amOIQwT1ZstV1IQCBJrwxKGdQw/F5pDjMNeqNnAZiw==
X-Received: by 2002:a63:1c50:: with SMTP id c16mr2203299pgm.255.1588672242862; 
 Tue, 05 May 2020 02:50:42 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id q21sm1553959pfg.131.2020.05.05.02.50.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 02:50:42 -0700 (PDT)
Date: Tue, 5 May 2020 15:20:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Message-ID: <20200505095040.uhmhralckdhlwysu@vireshk-i7>
References: <40141c5d6ca8a92c2c8322880ddd2dc123717070.1588669752.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40141c5d6ca8a92c2c8322880ddd2dc123717070.1588669752.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/utimensat: Migrate to new test framework
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 05-05-20, 14:40, Viresh Kumar wrote:
> This gets rid of the test script and updates the utimensat01.c file to
> handle most of the tests covered earlier (apart from testing the same
> for files owned by root, as the test is run as root right now).
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Hi Guys,
> 
> As discussed over LTP irc channel, I have tried to give this a try
> before converting the tests to time64. Please see if this looks
> reasonable.

Please discard this one and have a look at v2.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
