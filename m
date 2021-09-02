Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300E3FEA92
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 10:24:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC7FB3C2D5C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 10:24:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ECA9E3C29B2
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:24:04 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3F81A200DB1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:24:04 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3F4D73F046
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630571043;
 bh=mgzd70UBUCCry7ycIGnygE0veHWQhKxJAM9f9dc5Kf0=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=s1YUdCoTn5q0cABSnTt5NeZsj/pq4d+W3of7+FuzgYRwxRVAMT+ab/0Nv5pBIcPrA
 SkVW8fE9OnSsxoBtvjAtcCmEvZQbEKohO3xYMiqU4bUjKywV5efWBwfMKKuWC0b6d2
 nMTKccqKN+VTgMhrConsFEaFVUKxxGCdpvJyhrU0cn13nKBsMqZSbLe3III7vj0/1w
 wlZHgz1TQHcYhP29Q2ma6IcJxGWnDaHpUSxlRRY5kbK1+ULh31bvXgmSTsx2Tq2lMv
 odlefHZD5qAkhw+5rG2i1hIJFEvhyyaL/h9A7fBUMMTJS38oPHW5C6jKQhZi/FAysJ
 HXO+0nVHPazDw==
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so291849wrl.0
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 01:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgzd70UBUCCry7ycIGnygE0veHWQhKxJAM9f9dc5Kf0=;
 b=XePh1SrzYriNKOz4JvMQQj9AiTF61sGUkpkRpdDkuTrrENWRwo0QZFQPsu1hKUrcQt
 NjUqKT4SxNAR/p3jF87XprS8RjwVMy6yTEkzXTOCtjPy34lKyDL6Bna5ZdOwW5G0oEUJ
 lOe2UDEiLhM51gCa5dFnqYYBTEJgoOnPQCGs81J+HjoIjyPR/7pqyHazYGhATeJuIqmV
 lQVr/kmY1DHPPDKZLPKyTVpnEy71aNut8amflMDQN/Y9SsnQFJ4XGeJ9bk1aQHLvG6xF
 7wGxdE2TE8Tv7mW7GTj5X3/uXWgypzIK3NLAzb9WZJ3E3ecta4GVmQlrSAUOR4eAL98B
 UYKw==
X-Gm-Message-State: AOAM530/Qx2cOO9fJd0Lshye4ibJ9Lk8i16ZtPnRgWXCmuQT4ntE9h/m
 rFoOGH3exhOjsk3rBeR7mE181X1/5t7Xpk4yJ9cy5B08XJI0MF9yOvJdb8TzFzVq4hbVShBak4t
 +J36tOOxkzRqOYSSOF1dlzQcTnpWA
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr2173877wrc.233.1630571042159; 
 Thu, 02 Sep 2021 01:24:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVFY32TXzIgfH7ENM18vgQ7F3UFJ1puZyFOjgJ7/K6GexC1uDBT/DI3xDr7h8RNRNLlnI1iQ==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr2173866wrc.233.1630571041999; 
 Thu, 02 Sep 2021 01:24:01 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.166])
 by smtp.gmail.com with ESMTPSA id s13sm970856wmc.47.2021.09.02.01.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 01:24:01 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
 <20210901151655.95760-3-krzysztof.kozlowski@canonical.com>
 <YTCI3O7Et+VvYJfc@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <21179557-f1d9-4129-533e-eac6bfe8684b@canonical.com>
Date: Thu, 2 Sep 2021 10:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTCI3O7Et+VvYJfc@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/3] controllers/cpuacct: fix rmdir failures on
 early test abort
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

On 02/09/2021 10:18, Petr Vorel wrote:
> Hi Krzysztof,
> 
> ...
>> -	if [ -d "$testpath/subgroup_1" ]; then
>> -		rmdir $testpath/subgroup_*
>> +	if [ "$testpath" ]; then
>> +		if [ -d "$testpath/subgroup_1" ]; then
>> +			rmdir $testpath/subgroup_*
>> +		fi
>> +		rmdir $testpath
>>  	fi
> 
>> -	rmdir $testpath
>> -
> 
> LGTM, but how about use `rm -rf' instead?
> 
> e.g.
> 
> if [ "$testpath" ]; then
> 	rm -rf $testpath
> fi
> 
> That could simplify checks. Or is it needed to use `rmdir' to make sure there is
> no content in the directory? I suppose check like this is needed in cleanup,
> thus no problem to use `rm -rf'.

It isn't the point of this patch. I don't add here rmdir - all this code
was here before. The only thing added here is to check whether the
"testpath" variable is set or not.

I think using rm -rf should work, but anyway it's a separate commit :)


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
