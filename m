Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D30ADA9CE15
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Apr 2025 18:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1745598409; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=22+vmrZV/0LCKCNh+zJQg1Y+I0rWey2b5QtUeiyyaZo=;
 b=olSZukMPh5QQomIUqp6zt7zVeULNWjkKol3zNUYwXa3Iit6v5R49O0AFfhtKJTLuETBAz
 1/TPP73XQlHLpzb7g8JYBKvmcH2iQeUFCzpbDjwgFlVgh3q2Vvy6Py/CqCEFpUDDe5N8vkJ
 ayQW+GzNCNGSv4yUM4YL5DvtwResJLQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BA013CB877
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Apr 2025 18:26:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 43B4C3CB536
 for <ltp@lists.linux.it>; Fri, 25 Apr 2025 18:26:36 +0200 (CEST)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DC5FF600719
 for <ltp@lists.linux.it>; Fri, 25 Apr 2025 18:26:35 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5f624291db6so4348123a12.3
 for <ltp@lists.linux.it>; Fri, 25 Apr 2025 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1745598395; x=1746203195; darn=lists.linux.it;
 h=in-reply-to:references:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnpBW5wkU9AY7eTQ/g5Waof7UdaX8ZL/shSW6nogn1k=;
 b=Efb1C7k7iDBTM5JqPQ6YuBup21PdYOYY6sz4xINu9ZW+GVa05jdSGMEL0Lei8VSJb+
 oEY7kMmyKb23654JRZGHeoXpnJu1rdWEAvQWvIf1BUCahvkw57OXgG5KduMm+RIJqxsx
 byfzduA2nnvLWtJSsXDzKRel4HxSgdZ9yDFPkyxCZlb9V9WwWASw4cnNjXaHMcwTDZDy
 M/bfPZfoqTI5HsyRmBI1yN7GpbBazc3CXGnp88kUXRlPwrCzJoGp/zInxodNyXYJ9bFd
 AF6MMBcYo5kzyaEMxS2So/SVLgvTWl5ZgHvhMGuyarT8ct3KhRgoiWi4KWfk+rXVzmA6
 w+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745598395; x=1746203195;
 h=in-reply-to:references:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UnpBW5wkU9AY7eTQ/g5Waof7UdaX8ZL/shSW6nogn1k=;
 b=oHYKgCP0AJQFKTalWfM2zjoi+2Wng1Z7VpAPY7Tu/1sOeY5STzap+My83SVKd36BzS
 VyFT4OPYP8JaRh+S3WhDjA8gxcVE+12zicdl8lP87jVIDz8PQ9svXcIJ9+PMYzm2YTnw
 RkqmzTalNYouXdRq5TuOcRNqEvl9S3V+YN1Z8kDGD2UYNwLvoByey8EXbZqqd1UuH3wH
 e/QpMRKVY0XUPYlrZH+mMzCJ15liQ6tj6r78ewT+x62ta9DDxoCJw7eFktgofOxKEIx/
 sKe+JxFpkNG1qfcyJ6xBG6GNrFn7Ll3z0H5BBKRwVN3ca9KnSMdU4+tW6tsOQ5DYJieI
 iHpA==
X-Gm-Message-State: AOJu0YyzUe38QArmUCxkvk5nWdnCkzfAbfCtxUgxztiTxR/nPrbFkiat
 GnwSPQlGDDsEzL3K0iQpOlmKCLE5wJjUai6yzb0ZSUrQiNIDk+syNQ+fhtgkhd8=
X-Gm-Gg: ASbGnct267EVKN9Ol0h7Oj25gXUC8mjFMv7laVR5crsWE2yIo6E1iQPJYpxzy1MIb7K
 TapNKWRrz1fkwg+R/1pOrqPiVrYWsMlwWuaRXnz6xE8WrDaNypkfbO20ggzkCYAbYylyif/qOo5
 Dz7xchs8GolWALKWuB1qTrXD8ntLw7nMXUeNB/WyrGLG0oRG9jSTV/ocDPMkxxA2iXnhwUQDcOH
 sZCe06Oz3muNG2SRVULEluBIVhUy3wdE+JGzisULMZpDy5TNZgZSF6njzD2OJnpwwypybzpqIe7
 RIXkOjHTTxrDgLjuUERzeUvduxAA4g==
X-Google-Smtp-Source: AGHT+IE657Qxy/gk4bii4t4ga1ojNW+nyTzPlCCr/t6HePn6JaDKVbzirjXOTaajurc+H6OHOhPsJQ==
X-Received: by 2002:a17:907:7204:b0:acb:126f:5315 with SMTP id
 a640c23a62f3a-ace7136c6bamr259997666b.37.1745598395193; 
 Fri, 25 Apr 2025 09:26:35 -0700 (PDT)
Received: from localhost ([179.228.213.210])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b15f76f45b1sm3101728a12.1.2025.04.25.09.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:26:34 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 25 Apr 2025 13:26:29 -0300
Message-Id: <D9FUZHIQXDTN.50HL1NT2XOWA@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>
X-Mailer: aerc 0.20.1-31-gf6db7c329ce0-dirty
References: <20250414-conversions-mknod-v3-0-e08e7463bfaa@suse.com>
 <20250414-conversions-mknod-v3-5-e08e7463bfaa@suse.com>
 <aAuqqfJaul-3EI78@yuki.lan>
In-Reply-To: <aAuqqfJaul-3EI78@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 5/8] syscalls/mknod05: Convert to new API
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
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_via_ltp?= <ltp@lists.linux.it>
Reply-To: =?utf-8?B?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hey hey!

On Fri Apr 25, 2025 at 12:30 PM -03, Cyril Hrubis wrote:
> Hi!
>> -struct stat buf;		/* struct. to hold stat(2) o/p contents */
>> -struct passwd *user1;		/* struct. to hold getpwnam(3) o/p contents */
>> +#define MODE_RWX 0777
>> +#define MODE_SGID 2777
>                      ^
> 		     There is 0 missing here.
>
>
> And the test fail because of that because the mode is not interpreted as
> octal number. I guess that this could be fixed before the push.
>
> Other than this it looks fine. With that bit fixed:
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks for the review and sorry for the mess on the modes. I'll send a
new revision!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
