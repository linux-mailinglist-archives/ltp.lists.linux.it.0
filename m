Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C242E3C7009
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 13:57:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E0F53C8774
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 13:57:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 236E13C5FD8
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 13:56:59 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1777D200AEA
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 13:56:58 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id EB05140616
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626177416;
 bh=ErTOTWL+twlmvyY6cxq4i4nOojmHI8bmXv7VqBOJqJQ=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
 b=ggSDhNNqfAfcdC0XRM6uVP8b1E7Ax8GZ+DfP0fU5YxGl3drkw5HTTalEQzZGObgGn
 pvMJmXP+WOdnwz5dhbcF8BG0/7ew9DjyLo0TfTZydSkn0l4ubrMBdo58G8W0yk2izi
 YVXe7JZXiUXTkdDms+N++OyyMW2Jtw67NdFJnFbJslamh1qABCBJVLxxo8VfH68yws
 rbKSyoYIowfmqKxiHbQAvL9FkwB+/7sYicHr9ce6b/Ad/dtJzfGUhmDl5/YDfbhkUs
 25RIEhLFnyQ/s3WQtgHr+Y4qlnpFOk3nhzO/OzyPhO1s4+BjWHpJ6RL6TygEEmmIix
 PobYqvhW2u+gA==
Received: by mail-wm1-f70.google.com with SMTP id
 x6-20020a7bc2060000b0290218ad9a8d4aso432240wmi.1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 04:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ErTOTWL+twlmvyY6cxq4i4nOojmHI8bmXv7VqBOJqJQ=;
 b=t3k8rV/zd96F3WCQPOr+NlNkHDY/QfvWUbtTo8QtdIeJdfcmSdTtUKgnBYb9L8SHk0
 38Rb1wTIivd9+qWmYycDqzmWcjxydCd6E/3hYbyC8DBAmCWcbtTbjSHCIT3ZgN04qQfw
 8mecFYkEDcmwUvMI5wRPjMTNRYgxXVu7/fQXcsV5ItLlL8uIGYSrMe9HUNyuHQyG+Few
 H6vuPKPQSlvjjZJoYnkJgYc9WzZTgc1R4UV6/2z55CuSCr4a5RUBtE+bZ62A+tlM0YOk
 IlSxQOMFcKyVV/x22EBXwtjIFZ+glF1jsN+L/OvWv8BiyesW+q1aJTGXf2mCXQRVdar8
 qMFw==
X-Gm-Message-State: AOAM532OYrr+6H3jv2pjtCb33PGQFfjwm0J/MAwE22y+5qkeGPcvD1dr
 40jKVaUzjnPAIMJfNkY412S+IhH0ADGiV5/hZytxr8Eok3bjpZSCIt6f4ESSFG4l8EkV12ZH9Am
 aO1lLhBG1a0Gu5Mv8adKY0+2cBSRe
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr5113297wrj.359.1626177416327; 
 Tue, 13 Jul 2021 04:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTC98PharxnWaUUgPvm2J8vSoqvQhh5wJR1k9kwYWkExoJp79s7kuEE2toe50trUclghdo8w==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr5113287wrj.359.1626177416213; 
 Tue, 13 Jul 2021 04:56:56 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id f26sm9041887wmc.29.2021.07.13.04.56.55
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 04:56:55 -0700 (PDT)
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9c05b592-e474-6a3e-2dc1-ec075a0bc558@canonical.com>
Date: Tue, 13 Jul 2021 13:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] Failing test on failing shell commands
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhpIGFsbCwKCkkgaGF2ZSBhIGZhaWxpbmcgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IChpbgp0
ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvKSB3aGljaCBoaXRz
IHVuZXhwZWN0ZWQKT09NIG9uIG9uZSBvZiBlYXJsaWVyIGNvbW1hbmRzLCBhbHJlYWR5IGluIHRo
ZSB0ZXN0OgoKIDE4ICAgICAgICAgZWNobyAxID4gbWVtb3J5LnVzZV9oaWVyYXJjaHkKIDE5ICAg
ICAgICAgZWNobyAkUEFHRVNJWkUgPiBtZW1vcnkubGltaXRfaW5fYnl0ZXMKIDIwIAogMjEgICAg
ICAgICBta2RpciBzdWJncm91cCAgCm1rZGlyOiBjYW5ub3QgY3JlYXRlIGRpcmVjdG9yeSDigJhz
dWJncm91cOKAmTogQ2Fubm90IGFsbG9jYXRlIG1lbW9yeQovaG9tZS91YnVudHUvbHRwLWluc3Rh
bGwvdGVzdGNhc2VzL2Jpbi9tZW1jZ191c2VfaGllcmFyY2h5X3Rlc3Quc2g6IDIyOiBjZDogY2Fu
J3QgY2QgdG8gc3ViZ3JvdXAKClRoZSBjb21tYW5kIGRpZCBub3QgZmFpbCwgYXMgdGhlcmUgaXMg
bm8gInNldCAtZSIgYW5kIHRlc3QgZmFpbHMgbGF0ZXIuCkhvd2V2ZXIgdGhlcmUgY291bGQgYmUg
YSBjYXNlIHdoZXJlIHN1Y2ggZmFpbHVyZSBkb2VzIG5vdCB0cmlnZ2VyIGxhdGVyCmlzc3VlIGFu
ZCB0ZXN0IGlzIGEgZmFsc2UtcG9zaXRpdmUuCgpXaGF0IGlzIHRoZSBwcmFjdGljZSBmb3IgTFRQ
IHNoZWxsIHRlc3RzIHRvIGhhbmRsZSBraW5kIG9mIHByZXBhcmF0aW9uCmNvbW1hbmRzPyBNYXli
ZSB0aGlzIHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZToKCi0tLS0tLS0tCgpkaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3VzZV9o
aWVyYXJjaHlfdGVzdC5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVu
Y3Rpb25hbC9tZW1jZ191c2VfaGllcmFyY2h5X3Rlc3Quc2gKaW5kZXggOGJlMzQyNDk5ZWNlLi5m
OGRkODk0NmY4MGIgMTAwNzU1Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVt
Y2cvZnVuY3Rpb25hbC9tZW1jZ191c2VfaGllcmFyY2h5X3Rlc3Quc2gKKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3VzZV9oaWVyYXJjaHlf
dGVzdC5zaApAQCAtMTgsOCArMTgsOCBAQCB0ZXN0MSgpCiAgICAgICAgZWNobyAxID4gbWVtb3J5
LnVzZV9oaWVyYXJjaHkKICAgICAgICBlY2hvICRQQUdFU0laRSA+IG1lbW9yeS5saW1pdF9pbl9i
eXRlcwogCi0gICAgICAgbWtkaXIgc3ViZ3JvdXAKLSAgICAgICBjZCBzdWJncm91cAorICAgICAg
IEVYUEVDVF9QQVNTIG1rZGlyIHN1Ymdyb3VwCisgICAgICAgRVhQRUNUX1BBU1MgY2Qgc3ViZ3Jv
dXAKICAgICAgICB0ZXN0X3Byb2Nfa2lsbCAkKChQQUdFU0laRSAqIDMpKSAiLS1tbWFwLWxvY2sx
IiAkKChQQUdFU0laRSAqIDIpKSAwCiAKICAgICAgICBjZCAuLgoKQmVzdCByZWdhcmRzLApLcnp5
c3p0b2YKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
