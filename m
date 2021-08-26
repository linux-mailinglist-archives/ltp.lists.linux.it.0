Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 282703F84CE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 11:50:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB3B33C2F52
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 11:50:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64E403C2E39
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:50:30 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 71E43600762
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:50:29 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 770E83F043
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629971427;
 bh=kBp7JCjIfKlf6qMRhA19rRWRrKOVq4d6bB5I+Ynhpfk=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=T4QtaITuyOxGB7m2LTJm3vkyvV5w2MrCZ6tAHpuy+Vysi/ZGeUjrjWRT8eH1F54Ef
 Q3v0dtsJ0u/ztB5247B+ga3yeEegwagwq4e2pFuV2qR2fCLm+yC0T2CcjTvvaj+gfA
 gdkroACo1vPp7r/YDX3pJAjvBoeGGRwkOl9Nme0iSWUuZxFPi/WdenHHgGXdpX/jZf
 85cAP6gvZMsAaWre9+xp8gh93zlj5mm8fjIs1g9J2tf6cNOnBiq5a+PtfurUx1YGjM
 F8G9RMB1Zmt35HhvVDHuf952nsbDLrCqnWO9w1IZpqKdaC2nox3qGtw8hPHgXfe92i
 pBxMEph4k7Fdg==
Received: by mail-wr1-f70.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so647368wrv.16
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 02:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kBp7JCjIfKlf6qMRhA19rRWRrKOVq4d6bB5I+Ynhpfk=;
 b=kf1Rcu+ZkwA44dVeGnbPYfQGifKMCe3VVNcQVgby3VFShLBAV35LhGycxrRjF7snmb
 i11XQfl/OUlu73Fi1zcDTNivLq44i6WfzvhWcDWI11qJn0I862bJBrhffATr7yWsBitp
 RG8M+3acttVvaQUVQ5ppbjj9Ygsr949qsPtYIdzGwXySG2nFlq7WxD1OQCd/kbKPp76V
 /oiciApaeteaSWLZPiVSJ6sqD+irrtfwldJBU0ah3h5FDaCpdgvlbAWFFyMjV3/P7k+x
 XXgjO12cCAYmtAHBZlhyp1l6AJIDuzcd14Inh7FvtI2djHd7wfrNhR98WxfmbL7vT4dY
 fOqw==
X-Gm-Message-State: AOAM5337RqxriI54NlVohAGiIhpxNS8pJbQQUdrtFNCfuWOeY1s4kKaT
 PYMxwstIxc6ngWB1bFzHOjx+nlRpmnokkvH9eqh+NiJYgIvT/iu3kprGLilPLBTeLOb2Fhgf/uF
 BsO8m+drwWmG2XmlJoTt7foTgQOim
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr2916643wrj.72.1629971427162; 
 Thu, 26 Aug 2021 02:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi8Uw9MhASjdAFx2JZVp/oApyrkHDR0vPU0LCbKrmuT2GElOICty0uF6n3OMs1J6h589L+xQ==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr2916629wrj.72.1629971427020; 
 Thu, 26 Aug 2021 02:50:27 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.249])
 by smtp.gmail.com with ESMTPSA id w9sm2523795wrs.7.2021.08.26.02.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 02:50:26 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
 <20210820100028.97487-4-krzysztof.kozlowski@canonical.com>
 <YR+vZjqYBh/f6yAZ@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5342909d-f4fd-6d6d-80b9-4bd230ff7370@canonical.com>
Date: Thu, 26 Aug 2021 11:50:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR+vZjqYBh/f6yAZ@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/3] syscalls/msgstress: tune limit of
 processes for small machines
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

On 20/08/2021 15:34, Cyril Hrubis wrote:
> Hi!
>> Forking the exactly amount of processes as the limit (either from
>> max_pids or from cgroups) is risky - OS might be doing some work and
> 
> This comment does not seem to match the code. We apply the reserve to
> the cgroup limit only. If we wanted to make sure that the reserve is
> applied even in the case where there is no systemd cgroup we would have
> to apply it in the tst_get_free_pids_() just before we check if
> used_pids >= max_pids instead.

You are right. I'll move it to tst_get_free_pids_ to handle such case.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
