Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8BA285D6
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2025 09:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1738745099; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=2QLGRPJCOgCJkMVnzCxZWfb7ARtFqq425Ewudv09b3E=;
 b=Or1ghwrWDFn72vRJtyLGc9e2qLA2I20asxkcAtysor+QQyfK2+sD/NrHCY6OPWKe6PkTt
 8BLoIRmSL2/EC0dzUN1JzhBP/fJvuO4z6JxMH+kCH4RTXsn2eEaDadrIJe1JNJegO928ZV4
 v0sRQWEHdN/Z4OJYeN6GqaZfPkv8RcA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5BB83C91F8
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2025 09:44:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 07BF33C8F58
 for <ltp@lists.linux.it>; Wed,  5 Feb 2025 09:44:46 +0100 (CET)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 56846140112C
 for <ltp@lists.linux.it>; Wed,  5 Feb 2025 09:44:46 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso1087239666b.1
 for <ltp@lists.linux.it>; Wed, 05 Feb 2025 00:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1738745085; x=1739349885; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BxnYO/uv1hJBlC42UhDj8FgV6cX+3F7QelpnhU3RL+Q=;
 b=MP11UQv7DVwobxa6q0eCiE+INH0iy+Sw6ufh0g0Ru0L++0oILfiIKN4CHmyieh5gPt
 Ybak8afU5InXqkTU5uKBs8IsG51D9LJVV6Es83ljncACZP1bI17aytkxsTa7wpHo3ZgT
 mhYJT0e8BcxQrtVl3PhynWZIf1uso+yQ3kXQwzQGeWWbRn5yvJjUJ4eGgzMZRaXxZlk8
 ZDqKNTJigU6tsfMSn5M0BmMatQMxNynWLXnkK/O2wLdWtQl7adLVbSKnjro5sF/4dtzW
 EqxjC2jJTUhjxipjMcKG7LmE6dO+tYF5daO1NlOXzdCV6NmXU4JdgR6BmGHnnhN7U1z8
 uxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738745085; x=1739349885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BxnYO/uv1hJBlC42UhDj8FgV6cX+3F7QelpnhU3RL+Q=;
 b=KICMlIXzYrMwjImZ18Z9UlFUTcQ/MKlZJZ2YqCedq6ppPEKRtA0n/Ud+zSTrw9jdTt
 Ft0SjHeqmFrocMLlmimezdf7+5fGvZa651ndfMIDQc85Vd1/MedhJt+PFGe+IhshMfso
 DtuZBg2f4JtzCHozdyByYpq6A7cCADhv1P512gBSGlYtqQRVj5aH2A51Cv0vgzyxUS0y
 lLXF6mtBAtlynqJ7sUSZr8Z6G4MNr1OzAAhVtICzSFM+8puasUTymAQhQQxnnTW+pFJa
 RQfvqa6cel0BD/hI6tKmqTY++V/vxuRFicyLomWec924OfYNmc9iJvKOmA0H0qIatzw2
 /z9w==
X-Gm-Message-State: AOJu0YzTNk/34U3IM4OUe+DS1cikifsaVJxHi/SlCZv2k1v4Jcpk+DOc
 06vE7qQsk4V4FfoEEe0IicAp6CuDgxxQvaTk2hJSpZl2TY0TVVPiYjT0chUEDS/vXN5vG+XYQM9
 UOuY=
X-Gm-Gg: ASbGnct724lE0NcH0BVKF3bF2sDM1rKIB7d02YyrfcIASWYl07LRQGG6lQFAU3MCQjo
 jOqXquOu5IXE7Jvu+P3qb+3nGVEJdFGD9m7CNnvCNgX15XPWCTJiZ80G4Yt8MipZ0GKP5ap7QpT
 n8Idtou79gB61Qf4OA5veJXfbcYn958KoaZ1UQOjxTwsKLYA1k/RLgJq9kYaR9Mfx/+tigyptzJ
 1eIbC1YWoNF6HdizQY91LL47aqimqsiIqUIsuNm7KTR/NdVZsxyyKO/BktTs0eOzIw9XW651aM4
 Y5qRtN4nJs5HbAD7Jaezn9X+Dg==
X-Google-Smtp-Source: AGHT+IFi+3x6m64an5ZmZFt66dzRsKJsLo9c8xgNw4LzajBsJnOVZk7ogFbu/Sq76AeezXqcZRb2ZQ==
X-Received: by 2002:a17:907:9688:b0:aa6:9624:78f7 with SMTP id
 a640c23a62f3a-ab75e2466e1mr178610566b.17.1738745085458; 
 Wed, 05 Feb 2025 00:44:45 -0800 (PST)
Received: from [10.232.133.36] ([88.128.90.53])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a56cafsm1053782366b.168.2025.02.05.00.44.45
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 00:44:45 -0800 (PST)
Message-ID: <99e715d2-d30c-4bee-bd0a-30ab6929e58d@suse.com>
Date: Wed, 5 Feb 2025 09:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <20250204-doc_tests_list-v2-1-9d29aeacc3f3@suse.com>
Content-Language: en-US
In-Reply-To: <20250204-doc_tests_list-v2-1-9d29aeacc3f3@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] doc: add tests catalog page
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 2/4/25 15:24, Andrea Cervesato wrote:
> +    table = [
> +        '.. list-table::',
> +        '    :widths: 25, 25'
I just noticed that there's an alignment issue here. Please fix it 
before running "make" :-) I will fix it in the next version
> +        '   :header-rows: 1',
> +        '',
> +        '   * - Tag',
> +        '     - Info',
> +    ]
Andrea

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
