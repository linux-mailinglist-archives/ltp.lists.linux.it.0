Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418114790F
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 08:48:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF0873C2391
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 08:48:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A3B173C2374
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 08:48:11 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5517E20005D
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 08:48:10 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id p14so697798pfn.4
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 23:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yRGZdUJs0XpQXarBiVbRykkzv62KzgT55+9Y8a0kbpI=;
 b=MHf4vKgRhrKZrl63aZzgk3Xiaxe5Uvb8dlPC3aCUD/jsknCIwR/q1wiFjCANB3wdhT
 d8qvpO727pWs0sU0j0tJk/AiBHqh5m3RTCnoVSpJ1SO32tbjVZh32Cm+1Dz++tkoKk5B
 E9oDrK4sES+C37tz9Pb2+3x8O/li7l5I7N6XWJBvsvY9UtQSjewjnxBlJI98k5zFWkgf
 5DkrWoEFATNo5WzjEFoWYvlr7fHkMQfSu434amlfpFjjM7gva75Km9kWjv1SZnKLzMdd
 hmL8DlADKKSwjdmcI9vq0zoN2GwwshqoBBoWPO4YvQaiHmt7ojQPY4Bqtr3jOpsHp4Et
 LQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yRGZdUJs0XpQXarBiVbRykkzv62KzgT55+9Y8a0kbpI=;
 b=fC6P4S03Q6xsSrbtihTNvyZTkNMQnqLicnSb64eOJyHbE1ESgQNReNG2gI+fPa8yoS
 36G0wxPpRv2DL/gDufx7lmeV4yjmpxt2ANRFvatG3sQOtI2CnNJHNpcRLFc29wJz4Lvw
 pwTWXxl1CAoW6j5n1Rxw1FjJbP8Jh3U1eyloLSk5HYG/EQTjfdsT1eRO+zH28Rjtv0Qp
 wVkCEy+lHRp84L21KAJ3SiHNWtIo/TAn8BZqaQ2Lm7L4xTJ9/zqPWpwysr/PH4yxPgAS
 ZGamNjjiinqeTN11rqUJizpnFt2lQAE4WrMOhWDEp3/cpwXY1/9Q6LqXxKZ3R3OskR2r
 7SQQ==
X-Gm-Message-State: APjAAAVD0mdQVIpyfjc5EatpTdBaNnrbb/7mxi0+hrGWqq2ZQu0ghxqT
 hfKcdIl0mVT02izxCPW1xBZRyQ==
X-Google-Smtp-Source: APXvYqyT+GfyB/BbEWfXN/g2t1ERvhLXxSeSY3WiJStMi25F7omL5NiwsqDYHUoYLHWYPCMANSOy7Q==
X-Received: by 2002:a62:cdcb:: with SMTP id o194mr2070091pfg.117.1579852088646; 
 Thu, 23 Jan 2020 23:48:08 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id u26sm4895941pfn.46.2020.01.23.23.48.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 23:48:07 -0800 (PST)
Date: Fri, 24 Jan 2020 13:18:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: chrubis@suse.cz, ltp@lists.linux.it
Message-ID: <20200124074805.b2gk4jcu3jrvrczd@vireshk-i7>
References: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add Syscall numbers for io_pgetevents
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

Cyril,

On 23-01-20, 10:31, Viresh Kumar wrote:
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/lapi/syscalls/aarch64.in   | 1 +
>  include/lapi/syscalls/arm.in       | 1 +
>  include/lapi/syscalls/hppa.in      | 1 +
>  include/lapi/syscalls/i386.in      | 1 +
>  include/lapi/syscalls/ia64.in      | 1 +
>  include/lapi/syscalls/powerpc.in   | 1 +
>  include/lapi/syscalls/powerpc64.in | 1 +
>  include/lapi/syscalls/s390.in      | 1 +
>  include/lapi/syscalls/s390x.in     | 1 +
>  include/lapi/syscalls/sparc.in     | 1 +
>  include/lapi/syscalls/sparc64.in   | 1 +
>  include/lapi/syscalls/x86_64.in    | 1 +
>  12 files changed, 12 insertions(+)

Is it fine to send patches like this separately from the patches which
actually add the tests? Will you merge them alone as well?

Asking as I would be required to resend these patches (which just add
syscall number) along with the real tests, while they may never get
modified. I can then send such patches for future syscalls I am
working on.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
