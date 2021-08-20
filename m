Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A73F28C1
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 11:00:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 109C83C240B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 11:00:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6BEA63C1AEB
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 11:00:14 +0200 (CEST)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 802041400DAD
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 11:00:13 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id i9so19039016lfg.10
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cwWJwbNF48fiiWPXd4yhuo6v2hcLom0SUJ0ATimQiAM=;
 b=AzkIDQguvWRi5/Hyos3qiDHrooJjVyPcA9LgWfr+dNEkPJgV6agjeBKk7vR5Uw7kvc
 fBZ4Ep5TnsOKIeGUet5ISGKA/H92r1V48cMj8OI2t535FEhBcsGnA0oUoSEctcqBlhdR
 TEXqa8NHKwE3+44TtVX3bZxEvg/B8jhpnQ2xm57fOCY5d6tZoJPm8S33oh2MqEx7+FRs
 ncQw5PHIf94RX6ReZloeK9ng7HwZClXJjS5CNliX9kBiBK3S+o+zeMycV8kFOoFwoEvs
 jHeK2t9KfRUdoFL4WoGHON+Tg0AmOs1f1Fi7sdoVJ0BN+xQogZdi+6XIxqM88ScSHamk
 aWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwWJwbNF48fiiWPXd4yhuo6v2hcLom0SUJ0ATimQiAM=;
 b=eCsp541Pr+JG316SveQXUYVGtV0RCu81YAg45RJaEyBwpIod6N18O8DPjScmNT/6P2
 UA3KgGrQLIyB9rhlglonOurth6fz12pK8oHD9XrroaOXXmTIYc8PtD5pmR3pLkFkeVKo
 V0jE50o2ZaRINHWo5z9viGU+uLk60kbS3LvQB4sIj1zbh85k/G9zcCSnJVpIQUzzJQzF
 S81O3kWDr2+7vtOmvZtu8N43RSCSV3tXBZBv6LzqgLA9LWzJmSHIg0JTlEX51DqZGlSe
 RTiU7n+hEPX/6DLGbfX0r5dBBU/H8IT5Q9oOoO6sG+7fVItfomSPeL4ss6TMPA9lEzX1
 6pLw==
X-Gm-Message-State: AOAM533OKyoCNc4F5CuvuzhvTUe97qJAO3WAhiC1LRI6mw1PiC61tOhK
 HQhHzMql8IMgU7ktGebJXAZRVAMTIZn5
X-Google-Smtp-Source: ABdhPJxtv8VXjg5x+kzjkSffDfDtdwaam8+QYxLnDsnb2b54GW71WSYlTPf+Nc1pMzMtY0s06gRtKA==
X-Received: by 2002:ac2:5d67:: with SMTP id h7mr14214504lft.639.1629450012660; 
 Fri, 20 Aug 2021 02:00:12 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.3])
 by smtp.gmail.com with ESMTPSA id l14sm464120lji.106.2021.08.20.02.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 02:00:12 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210819152154.16185-1-aleksei.kodanev@bell-sw.com>
 <YR6Ax7TXsa5tipei@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <bc8fc318-f396-0d45-69f9-814e750311a8@bell-sw.com>
Date: Fri, 20 Aug 2021 12:00:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YR6Ax7TXsa5tipei@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test.sh: fix ROD_SILENT command return
 status check
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

On 19.08.2021 19:03, Petr Vorel wrote:
> Hi Alexey,
> 
>> "local tst_out=$(some_command)" always returns status 0, i.e.
>> not the return status of the command in the assignment, but the
>> status for 'local' builtin command, which creates a new local
>> variable inside the function.
> 
>> As a result, the library calls and tests that invoke ROD_SILENT
>> don't actually check the return status of commands passed to it.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Very good catch, thanks!
> 
> Tested-by: Petr Vorel <pvorel@suse.cz>
> Working the same in: bash, dash, busybox sh, mksh (android).
> 
>> The old API library function is also fixed.
> +1
> 

Applied. Thanks Petr!



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
