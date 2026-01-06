Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D761CF7E0A
	for <lists+linux-ltp@lfdr.de>; Tue, 06 Jan 2026 11:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1767696622; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=hPEWJEsErhcY22LX1n6vRUBXc3j3krOcknhcP72AU4Q=;
 b=O/IUaaHLox0nbMVJ+fSoVpgvmiUO1/J81qzRgCAY1kG2+qtE1rqMygrofOHmr2jNTZh5X
 ifcScCrNf4UeLqvrn97g97wbyPUOyYBiuE58+xLUwd+aSwPK7aEaMP0yO6ev8etcq9RkjV6
 U9bG9ppe1vy3dodUnGBeD0h6hoyzBv4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C6DC3C1DA7
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jan 2026 11:50:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C6C43C029D
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 11:50:08 +0100 (CET)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4CDEB600625
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 11:50:08 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so6899945e9.3
 for <ltp@lists.linux.it>; Tue, 06 Jan 2026 02:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767696608; x=1768301408; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9n49ebRHAun+QZwLkK2RpUzoxQoMz6saJKjOURB9Dbg=;
 b=OgKekJR3xS3NNHktsBieUcE+qMMLuq2IpDcBb7rkrYiQ/ISeD+hT5SXnz7A7gil0l3
 dI3mt/FT9jNhXWFgzQ1JuI8rELOvM8LvV5aluCoEbSru7E1vpvLCWQYfZm8uFML2t4z3
 fRrNIVlusoPVN055VbTnclKXLxbnQcOUwpUQ6XJvNjDe+pKd4dSuEH07GRUKO2FY6yr+
 7UX9rwaDeIj1h/SVM5OAxcUTJKpFk5ZDOTrMdgiwLdJeDNB6Y/jbEt7hRI1occJxj7Dv
 8+PViV5arLc8vruSWuLW1wcRamsoLbKPGSo+HhGeaLbXYPTiCfw17LRDZyI1CEYpfFgq
 HYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767696608; x=1768301408;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9n49ebRHAun+QZwLkK2RpUzoxQoMz6saJKjOURB9Dbg=;
 b=E9neRKqwBw4X2ydqJSh5ACHinma8821/z6oorm3AldOf7pvESZm4tyuKcaUr356F83
 ljTV8vSq45HXCWSU/pWHVkteBwvO7npZh02fX0Fm3quN5HHMOGdW9CaJlxVS5hoGa6Fq
 z/PYIJYgdLbdC2M9kDP52+Gd8d2wT/muIZPWO840nanG7rb94ZstoT0pBbu0XZf485mA
 +bgpjR1peetK8qwsmh0Ib1I2U1QZjBMcQsJNGo2xwdUOkShyUvdTPQLOIRPsoKSUOWjE
 VuHTmwhSaDGeJSeTI9u51bvY+9raAAxC0bvQTcXZQ9GEzSjbTbT+ZxYYFB4cg6LJt8aW
 1Zcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTcv7FAD3eZ2s9prRUFMKzCTg9RWcWEJRLvM58t4+RVw6CCo8qkyLPw5/I7VyhxE13wHk=@lists.linux.it
X-Gm-Message-State: AOJu0Yx2XYQuogiCCX7F2+B26239jS2oWQ+m9etnTkFJofLM04cbBauV
 BFY8bk8Ef1gPcdvNag9nku3j/ZRY7+6urkypUXOc6qahROqSO4RgxY7dZDpjg/dEBXI=
X-Gm-Gg: AY/fxX7iEF8WBxqmErOjhtzXBU+fYz9Io8JfX4HaGkW7IJeGCnIv5zFIJOvznyjv8Fc
 dHf0M9rrYKx3aqtXo+M+wRcI6ZJ5YlFIPnevllc2gzB9wKva+wCgtzpdZXYQZsfIQKUxUyF8V+V
 P9ChM6Ketyr2lxU0ex3du22wJaHgBRVNOaygZ1AjNFjzrXLzZNrnixOnjMMcCZR/ERMwNljQpE8
 uHaBaed3dzRihThvgMw/YkLfIK+4PDpwr4SaUNiImGL248IxKq9zefv83ZOMJzKZ53tl/b73gdv
 yvhSSFYi8Yxk541/uVt/ifekiSdy8nRBVM7YJkJOdKYCbjT90H4/8WeBJL2EOLwK3mQFS0UPR/1
 SkX8fF+CohU84JacnTB7rjVE8R/I7EJ/4y25+Zg0iOyuG04G+nK8HLeK4ExskV6n/dQUwdtRKYN
 vQMMGFFrOCSFMu
X-Google-Smtp-Source: AGHT+IHwihPk8B8aR40GfKpEsA+m8IvUKo/urn+T72gItqo2BvsLq79c59EEJ6fVHDAfPKx7iokI2A==
X-Received: by 2002:a05:600c:a4a:b0:47a:829a:ebb with SMTP id
 5b1f17b1804b1-47d7f09776fmr26972475e9.19.1767696607651; 
 Tue, 06 Jan 2026 02:50:07 -0800 (PST)
Received: from localhost ([88.128.90.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7fb657b3sm14409735e9.20.2026.01.06.02.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 02:50:07 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 06 Jan 2026 11:50:06 +0100
Message-Id: <DFHG5E7ZNVQB.1R4YPIZ6X5603@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260105130359.647879-1-pvorel@suse.cz>
 <20260105130359.647879-2-pvorel@suse.cz>
In-Reply-To: <20260105130359.647879-2-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] checkpatch.pl: spelling.txt: Update to
 next-20260105
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

Hard to review :-D I guess it's a copy/paste, isn't it?

Acked-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
