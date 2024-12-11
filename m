Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E039EC993
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2024 10:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1733910345; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=6OdRSR+OoTF71uzBf7WA+M3mARU81iLwkiJBt4LsDbU=;
 b=Q0v38Q75wLcbjEXAwoPBTYksi02ajuFWoBATwx3qz59U/no4Y8rh8mv2PNCv0gb9miMHp
 y4Ek6br4OlDHXqjBU4FSetFtZxEd0hjHv+BHRgpNk6AWPewukuLdQGQj75jXrTsTnZ22qjK
 nAoOgnkAruQrJcNmQVbh33gFHUrr634=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 412A93E7D0C
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2024 10:45:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD1053E5ACA
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 10:45:32 +0100 (CET)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1AB751BBBB86
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 10:45:32 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso3028361f8f.0
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 01:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1733910331; x=1734515131; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z8TKJu1S8/mLX2MSxte+IQhkQciIU/S+70wXjlhcH1U=;
 b=LOrZZYBBgYxXTTCML/DB4tFvyHAJlDwVZKEf4k1aqDdnswmpon1IhmWsT6ZzY5vY96
 XnrTAdfWDkASOJIhTslVRlTrSXt2BTowkrMnAFbzoHBu/xbEfHxCiQusosoXdSPHlLUJ
 3Pkbpr9lSXcSTfgUwEX2TY9Tr0sPIrQNmR/RLgKl7/Wju/IiNlqrPZRffbWKYscL888J
 sxQj58QoXPj01AN8oALqFjDs1OwG2ZHPDiTvJ6Cly0VOxuLhP1V1NU3uyV7zTEajttrK
 ttpzdN9yG6jjQyqu0vVtNo/ku8+EA+Mik6mCZRLI/h0uaqyRpnwjisKN/NOdhOqi+DA+
 f7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733910331; x=1734515131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8TKJu1S8/mLX2MSxte+IQhkQciIU/S+70wXjlhcH1U=;
 b=OYDq9Vwp/3MYkjuGJzUzSXii+VRxVUL8k1IY+37ZS0hqVdZCn24ci3QNkItMFcPjLE
 AtaSBfg9PRURPVxhWvMam0PhJH0ws3QAWVADBzoONmi8SBAYkJEMAZJekjEBM3mXrYNO
 2BUF10VlJpta+xVD1nEROWMN4WwOQcCH0ajwEgIxZdOyaVZHIJSVbBZ5PkQ+/ekiHrjv
 YNGwsjepbWUkO8GWa/NNqMi8hu8CmLcIer/M1F+O+L1N16copgsceLGsS6tIdU2sm651
 D7sBJas+4NDQCmDmGJW8Dv79jiKnTpGwt/gOlJgG0UcEBk602XTzJzM9+7oz1qEMilP+
 1snA==
X-Gm-Message-State: AOJu0Yy8j3bMQdHUBRPqjbqvk3c/8/Bq0KZxiOYG0dS/IWRqilACFVc8
 QfIHrJLcBB1ZhgWiNAFI+Oc+qUWsGOT+wHsa1tDgTBOi+cxv50agM22eUQOA4O6YgPoZJPrbUxo
 wADw=
X-Gm-Gg: ASbGncvlpB1vDHVI6KnuxOEONnu45BNLgF/QHKtqZfodvw+zh68gP/Z0LtmWnmXdaZD
 fL1f6aBOjT9Om8WkuleQGxs21BdteSq89Cooh4KnPn57QS+UE18Sdf5nQGw/Gtgvs8QTBQ7Fwzr
 fiii04A+AOzNKZVRn//56AQVC08/lY3dqF3XOgaSnMThMYuHiJ4nd0KvXnB01WjmPUtHG3Hsa7o
 eaWlHxB7TzNW8NITnsHPFnogGz4MYSgHqIuqngpU3cWlw+e4fpW+sTIwdTmVYq9Ng==
X-Google-Smtp-Source: AGHT+IHbz8mD6cVVCtMhKy2RWGkQiNY0KFN+Pf/bt6EPhEuos93S8hdfz6jhbH95ooWzeI7wPixwBw==
X-Received: by 2002:a05:6000:4719:b0:385:fd07:85f8 with SMTP id
 ffacd0b85a97d-3864ce5db50mr1471418f8f.29.1733910331320; 
 Wed, 11 Dec 2024 01:45:31 -0800 (PST)
Received: from [192.168.42.37] ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef2700979fsm14405100a91.18.2024.12.11.01.45.29
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 01:45:30 -0800 (PST)
Message-ID: <ae3b5208-6276-4569-b78c-8ff95bd2c4d2@suse.com>
Date: Wed, 11 Dec 2024 10:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <20241203151530.16882-1-chrubis@suse.cz>
Content-Language: en-US
In-Reply-To: <20241203151530.16882-1-chrubis@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/5] First new shell library converted test
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

Hi Cyril,

I had time to take a look at it closer and it looks really promising.
Thanks for this support, it simplifies tests quite a lot.

Andrea

On 12/3/24 16:15, Cyril Hrubis wrote:
> This patchset contains a few fixes for the new shell library and first
> converted test.
>
> Cyril Hrubis (5):
>    tst_run_shell: Add save_restore parser
>    libs/ujson: Fix "Garbage after JSON string!" in strict mode
>    tst_run_shell: Better errors for metadata extractor
>    lib/tst_res_.c: Add TBROK handler + more verbose errors
>    mem/vma05.sh: Convert to the new shell library
>
>   libs/ujson/ujson_reader.c         |  6 +-
>   testcases/kernel/mem/vma/vma05.sh | 97 ++++++++++++++++---------------
>   testcases/lib/tst_res_.c          | 22 ++++---
>   testcases/lib/tst_run_shell.c     | 97 +++++++++++++++++++++++++++++--
>   4 files changed, 162 insertions(+), 60 deletions(-)
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
