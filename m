Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKmILYXNp2m6jwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 07:13:25 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 523CE1FB082
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 07:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772604804; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=LIAUdKIqnc3ZP7SqyHh8DcjkXCk97S8y4xQrR2eSPbU=;
 b=HbdCE3adBibAGp5Tq1j08G2umMJR/sqP6pBp8rd8Fzk09AOY6p20x5fMd+TnYfPnAdBRq
 QuVTNtxaX/pJMt8JqZfyQxNOcllxf4/C3bb/yhjmJpybRB8t3LNQBNDRINhaeasXU1yWG1o
 9m0nBbwyA/SPcBG8a7zXxC3ekOjNd6o=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3BB83DAD37
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 07:13:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D1F13C2CC6
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 07:13:11 +0100 (CET)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F328D1A00450
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 07:13:10 +0100 (CET)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 18DBE3F581
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 06:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1772604790;
 bh=cHrRq/KEmd3obnL1BzrNFdJwxzZ1arILlJkLTKWNyC8=;
 h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To;
 b=buS0vYsuYEaeK2TzWCr13eVy6btyCDGeNCxz2HO7x+eiQUugI2JEEt92mthiBBWeS
 YKCCvY8udlj0PdCynx7mtq3J4S0UP1NmBc7iEwxGP6QqOgn4rsSnKBz54dwAKJzmNf
 5sfuNaMRF9cf1je/BkhWZ6XaO2PMTmHLLjWKsZdD3pN6eOXWIqfAWZ4BGPQGoOvEhy
 Wf8mIQ8/vema5VtvEEbOmaEeKxsK2BRr63slnlaIEBGipJF1mZDvDwQCVKDq7vxbBJ
 5OaSuUi2ewIB6swPocrugNuGcZK7yTFEYbBshRC+7HnYvAUHRq38QJmr6ElKgU+e4A
 OgGau8e0ELgEmUvsD7Qf1O4QQthVDJdgnGQBR2e/E/QHw1F/LNQPySHgsF/78WimRG
 dnUvGRvSlD0B5S6RQvLlc2qug1QrsKFbhcxZo8Dwxp8i6ai5XhILk4a96wgS8CX4/F
 VutTrhmbC1KqyFKJN5Euj8Hil0gVR34kTmdHx7NcRZixwkS+QpYKsUW6LVU9l982tU
 KV3DmVXwsy7qGg9iIDdwBiyImm2VjSOg0oBBQLFfx3+/8P6nj6Q689OElL5VLsUc/H
 KlgglS228XZzJgzbsy82FoGJGojPkVFRLt4AxNrijJo7XSC0ZfmY/lKWSRVr7JaVTX
 /rsZkaErWD6d0RjrhAYNl05M=
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ae6961bff0so26296475ad.2
 for <ltp@lists.linux.it>; Tue, 03 Mar 2026 22:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772604788; x=1773209588;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cHrRq/KEmd3obnL1BzrNFdJwxzZ1arILlJkLTKWNyC8=;
 b=fgFsITkoUnlHY6sjeFvCC9PRROwjOLZHFd5+OOTwoQJ4jpXJBJO6oDg7lkc3Zb5Yus
 /aC6uY/WYliEschDTfGnzjPamsEMRosEj53kz5t4zLGIuEFhRKrIjXevNsnnxxpEzWmp
 0X/ygQkq1nvOERWvnsQD6moOdA6R4RGPilxC0PvxTrQG9baSRfTZ583PVHiO4+8UGcb7
 fPuymxT2cDxeUMY02BE0LvRug/rK215UaEkYHyZkrweSVDNybpaIhDs5tJdOCb7Webtc
 Az+3TUh4JsQ12cCv5FNUNUFBqJOA0GcZYY6adWhIDhaGxXHv01rF7XyYAHrsLFchT+mL
 cCEw==
X-Gm-Message-State: AOJu0YyZUI+7rbluDOcIzJuGyiA+jGNSw2dJ1HrXJXIXLU/fcV7exy97
 I9CpR+m8mYrQ/0D7/JSqI0q8HAKRp/ZX07YmJr+WEm1ot1BrTjmLr4vfLR7OFM4jTQ8tZ25zvX8
 Esi6o7JeoTTTOrRJnhKJ+o8tX7hxzRCoMIzMScZkprQLJY146tQ+BVOrozvUmeBR8jdiJ
X-Gm-Gg: ATEYQzxoOVymUwTR7Dl1uCwTIYGC1i4CKugddB1LRS9v5J8vsppjVwJRF+FDxqbDwAo
 RA4Ejxkvg4AnGA9gcMmOQnbmbiqtYi5lq5d2AkLw85lK9Aq2q/GjpQYG6gzb9DD0s7njIWfJHhq
 WjQ0/YInu1M8CNwC3zOdYj130egppKmXjeT44Gj9+0Hw5H5C+asC+dhJqfAW48cVj/Xv+5w/ZKZ
 zGG7ItmYGqNDwWHdOS0OTchKvKZ4QLneQpXRP5NjFQft5l8Ap0z2zSGvOiDjewAkt8BfmkN/WQM
 dTKh9VDI0tgyd5rsEp+C/ViAnlJu4n9ewI3Aj3mGbpDAZ2Lva8eKQeQYSHlPiFrsd7CX9UYwp3s
 21z6UYiP881OPwLP1uxlK4+ZGaRtKBA==
X-Received: by 2002:a17:903:9ce:b0:2ae:5464:7a4b with SMTP id
 d9443c01a7336-2ae6aa09375mr9608435ad.14.1772604788532; 
 Tue, 03 Mar 2026 22:13:08 -0800 (PST)
X-Received: by 2002:a17:903:9ce:b0:2ae:5464:7a4b with SMTP id
 d9443c01a7336-2ae6aa09375mr9608315ad.14.1772604788195; 
 Tue, 03 Mar 2026 22:13:08 -0800 (PST)
Received: from [10.0.0.86] ([123.208.221.96]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69ef1csm196090375ad.53.2026.03.03.22.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 22:13:07 -0800 (PST)
Message-ID: <35083d4b-e438-4061-b7d9-90984b7afd17@canonical.com>
Date: Wed, 4 Mar 2026 17:13:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Wang <liwang@redhat.com>
References: <20260226103502.70043-1-changwei.zou@canonical.com>
 <CAEemH2e1Fo2Ns=Pq8YbqbC1eQ5NAYKNCA46jfZofn2rhfnrthg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAEemH2e1Fo2Ns=Pq8YbqbC1eQ5NAYKNCA46jfZofn2rhfnrthg@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] clone10.c: avoid using the libc thread memory
 model in touch_tls_in_child()
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
From: Changwei Zou via ltp <ltp@lists.linux.it>
Reply-To: Changwei Zou <changwei.zou@canonical.com>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 523CE1FB082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[canonical.com:s=20251003];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[changwei.zou@canonical.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,canonical.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:replyto,canonical.com:mid,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Action: no action

Hi Team,
Thank you very much for your help.
Kind regards,
Changwei


On 3/4/26 16:59, Li Wang wrote:
>
> Patch merged, thanks!
>
> -- 
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
