Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A230593B22D
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2024 15:59:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1721829561; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=ficSOMzF3zoq3cYEbS8ZCs7fzO5paXRjUNzLkFs7mCE=;
 b=nC1tXa5Sh6vX46gS+Xv2lQJOl6erXcr7bp3yblD2MgnX8ZQz56XvLzE151rtPq/qdg/9S
 ApeSRBJEhmtwmAlIMmm3dcsShkPuz3V+AHi4Q7gD3+o+UrcowUne1X3LM41hYdE358p33ZG
 vnjJdP+AjENCrVKKghqAKA9T7ssbl70=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A5273D1C3D
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2024 15:59:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9FB443C21C6
 for <ltp@lists.linux.it>; Wed, 24 Jul 2024 15:59:09 +0200 (CEST)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A1F7F60019A
 for <ltp@lists.linux.it>; Wed, 24 Jul 2024 15:59:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so5764722a12.2
 for <ltp@lists.linux.it>; Wed, 24 Jul 2024 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1721829548; x=1722434348; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZdIXOzf9XyfticD4jmnx3lx1NsjJSAzvtbcPUPfZiM=;
 b=WOXyGkJfd3S+5Kq54S4BkoFTrcm6qM3Q5h3O7+Vow9lyIziSz70FZSMMnAqLIiimef
 +LOZSjTKPBMlazDdIX0R97ZHuEQVGZ3JzAT0PglGgpqiWJt9ZE/pI6zCK0yx8yNZkJ7D
 AEWFE6iyARo+eIyHXjtVNFbAkVoF/Z462ZMQs8Lrpa+KMhWDPnfFOy8gwikFXW5YTvKe
 riLh2Xjzw5PBJ+7g6rZ8c+pzBQnj51biksowDhAi7da1gHd5LO6FJ5QbvjlO3GYJDFxj
 ZarZnSg8xiZB79+PRtUiAk18PrkRCwpjHVhFwsIYUz9okoVmH+hWmmWYtnX7HJlGu22F
 weng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721829548; x=1722434348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZdIXOzf9XyfticD4jmnx3lx1NsjJSAzvtbcPUPfZiM=;
 b=he6vg/Xovw+ZNtWchchDwiG7Tx7f8SqAyDesHeWCQt5+PQ/XcUYJXhjlndNRA206bD
 G2GTqwKkPBZS4rX3MmaXKQoWlR/dTFVpNxAohaAxPgTSAXSbexxjSX9cJOGleuvdUAeK
 sJWMCMXRPX9/+LHgtcb43seWZ3/aeJJGGkyXERB7m3irG8cKlNjZ8oRO1ia3ENoLlkTX
 V/O+5WPpfSLmvGMfhCk6lrniLmfvozNHHDBUMsUTN5m34dzkDHcSWCSJTvGf/LTqmXRV
 9VnQJXoNE2CsO9o4vgafXlKFbJqZF2HtUJpLPDBFpzN21ariYPlkD+NVV4dVS/BLjQjD
 1lpA==
X-Gm-Message-State: AOJu0YwXH7vI9+6cvr7z7Ap5Z/3NbkXbk8fwVK4Maz/8IyyF4XkrLr4C
 CtcB77abnGljIms8HMCR8YIg4B35KJ8fv38VDsVNICJ9K+C8m2TMGseIzNTNuYISIUbBKuBAxbL
 2+ZM=
X-Google-Smtp-Source: AGHT+IHrfb3q8ap6z+0wwktVEDG48eJ+fJB0NB8JYHYtm+UHvUburzlwusuw9a4t6RSIPRdNEgPAkg==
X-Received: by 2002:a17:907:da1:b0:a7a:bbbb:6243 with SMTP id
 a640c23a62f3a-a7abbbb6401mr95170066b.51.1721829547685; 
 Wed, 24 Jul 2024 06:59:07 -0700 (PDT)
Received: from [172.20.10.3] ([37.162.108.111])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c91e09csm645190866b.155.2024.07.24.06.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 06:59:07 -0700 (PDT)
Message-ID: <9cad4b74-5e2f-4b35-88f0-f20467a9a2d2@suse.com>
Date: Wed, 24 Jul 2024 15:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240723-mseal-v2-0-5aa872d611bc@suse.com>
 <20240723-mseal-v2-1-5aa872d611bc@suse.com> <ZqDkjOCm2VqO2Vq_@yuki>
Content-Language: en-US
In-Reply-To: <ZqDkjOCm2VqO2Vq_@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] Add mseal() syscall declaration
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

I can send v3 if needed.

On 7/24/24 13:25, Cyril Hrubis wrote:
> Hi!
> This patch obviously does not apply after I've merged cachestat. I guess
> that the easiest solution is to have a one patch that adds all these
> fallbacks for all new syscalls you are working on pushed first,
> otherwise there will be conflicts for each patchset.
>
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
