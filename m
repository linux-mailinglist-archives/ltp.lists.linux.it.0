Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F79648AD
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2024 16:38:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43DB33D2811
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2024 16:38:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BBC183D06B7
 for <ltp@lists.linux.it>; Thu, 29 Aug 2024 16:38:10 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AE20B100608F
 for <ltp@lists.linux.it>; Thu, 29 Aug 2024 16:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724942287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OsCX0ZyOxWwSEV2gyoydMLj2nN0vlKj1gl2mA+dgOIY=;
 b=aS9Xp64gJj7cmp+2eMHWV64cGPv3avG9jEB94GjtLPXVestRLq7oI0wCoolmyN2RGh6aDr
 AblQHfr7Y8YbT4WpeOnux77DuTk0Mzntf7CUNNxk5IIVVr73ncpSpM2fdeGJUSkT7hQIHY
 3abDLyDDCY6vmMjgqkErCI95PiiQEfU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-AaxZ9C7ZNr6Q6-MqMumtfg-1; Thu, 29 Aug 2024 10:38:06 -0400
X-MC-Unique: AaxZ9C7ZNr6Q6-MqMumtfg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42ba94a0555so7416445e9.0
 for <ltp@lists.linux.it>; Thu, 29 Aug 2024 07:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724942284; x=1725547084;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OsCX0ZyOxWwSEV2gyoydMLj2nN0vlKj1gl2mA+dgOIY=;
 b=rQ14yg//l7pf4cy/P3OLJoaSrKipVlLr2WWNM/DBu2EGf+834rur3XSM76/uxgaLij
 D14m2GOxGkLoqp9rKfYT+mhS52A0ubv3QOvAAfMizTH57M524V8nNTZNnw/sQKS303e/
 C8k51NJD67d6Wui0+195vkArWdOuyRx3Q2+NQayy2cdm++keBfvh7y2vCJwj4W3riNns
 zPQOPQ1yLQlCvFPMlwlPik64tX2Sp4mApkLXRlsS4r+a2paRXQLMIsop2m5FjzjrixsQ
 iQ78cC9U7mNM6Ig31ps+YguK0QsaPzN/YUaSzZK8W4lykShiREZFCAqqwWCJCRd/yDsu
 dPMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW34OmwADFd7kXplJDkzXzmdjcMJlHl0KvwjdChZWxnRKaHGDRx52eBPCaLN7R8AYTOEE=@lists.linux.it
X-Gm-Message-State: AOJu0YwDUp2U1mG7DtNw6s5iiLKOEHOgPTCQxdje/i51FIOmxNJyDUEX
 srA5Gz8IkN95WnA2GmudNLdspFfb9VstlpzmFcOT5JuB6rXwEsxUu4ebzJeTcXmOYYNCYyaBtz/
 diUJg5O2mPvlj295T6Ib4V5TUbkHo3xYYJBIylF0qBF4KpTV4
X-Received: by 2002:a05:600c:3596:b0:426:629f:154e with SMTP id
 5b1f17b1804b1-42bb02d970dmr19969405e9.30.1724942284328; 
 Thu, 29 Aug 2024 07:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRpyGTsRQlxPkowSA5gXPZRCPCgPVQClP0RB72O4ew2XXmZ1TW0z28Qq5ZkWK2DfgaNfnwOw==
X-Received: by 2002:a05:600c:3596:b0:426:629f:154e with SMTP id
 5b1f17b1804b1-42bb02d970dmr19968375e9.30.1724942283356; 
 Thu, 29 Aug 2024 07:38:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:c600:c1d6:7158:f946:f083?
 (p200300cbc711c600c1d67158f946f083.dip0.t-ipconnect.de.
 [2003:cb:c711:c600:c1d6:7158:f946:f083])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee413a8sm1587922f8f.6.2024.08.29.07.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 07:38:02 -0700 (PDT)
Message-ID: <f657523e-440f-4862-8497-a2fe99ad7bf5@redhat.com>
Date: Thu, 29 Aug 2024 16:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>
References: <202408211026.636ade1a-oliver.sang@intel.com>
 <767d1908-dc30-42ae-9a8a-d2ad42a4d491@redhat.com>
 <8bde28af-3401-4d72-b821-d8cf01bbcd64@redhat.com> <Zs7-A5S_ivFlosrj@yuki.lan>
 <c6fb5f16-59bb-47a5-a2dd-3c4207d73614@redhat.com> <Zs8W3nQszwhbSiT9@yuki.lan>
 <4c190c79-401e-43a9-a4d1-e64f78110e0b@redhat.com> <Zs8Yg7nXZHG8U821@yuki.lan>
 <8a16ac0e-4a3f-48cc-a118-ea05c23d5d2b@redhat.com> <ZtCGVr8l_Eq5uVlu@yuki.lan>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZtCGVr8l_Eq5uVlu@yuki.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Status: No, score=1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,SUBJ_LACKS_WORDS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [linux-next:master] [mm/migrate] b28dd7507f:
 ltp.move_pages04.fail
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
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, lkp@intel.com,
 Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 ltp@lists.linux.it, Matthew Wilcox <willy@infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>, Sven Schnelle <svens@linux.ibm.com>,
 Zi Yan <ziy@nvidia.com>, oe-lkp@lists.linux.dev,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 29.08.24 16:31, Cyril Hrubis wrote:
> Hi!
>>>>> Also I think there is a third case that we do not cover either, what
>>>>> happens when we pass an address that is not mapped at all, e.g. NULL? Do
>>>>> we get EFAULT as well?
>>>>
>>>> Yes, that's documented as EFAULT and should behave that way. I can
>>>> extend the test to handle that as well.
>>>
>>> Ideally the test should be ported to the new test API as well, but I can
>>> do that later on the top of your work.
>>
>> I tried, and it all looked easy, until I realized that these tests use a
>> share code-base:
>> 	testcases/kernel/syscalls/move_pages/move_pages_support.c
>>
>> That is also written using the old API. I assume mixing APIs might not
>> work as expected ...
> 
> The tst_resm() and tst_brkm() calls are redirected proplery in the case
> that the test runs with a new API so generally it should work fine as
> long as the cleanup callback is set to NULL for the tst_brkm(). That
> was one of the design decision we took years ago, because we knew that
> we are not going to reimplement thousands of tests instantly and that
> the old and new API would have to live alongside for a decade.

Ah, the "NULL" is the magic bit.

> 
> I glanced over the code and I do not see anything in the
> move_paves_support.c or in the kernel/lib/numa_helper.c that would break
> when executed under the new library test.

Okay, good. I can send a follow up to convert that file once the 
fix/extension was reviewed.

-- 
Cheers,

David / dhildenb


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
