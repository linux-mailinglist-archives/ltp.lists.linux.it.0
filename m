Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1ED3C701D
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:07:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DD573C877C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:07:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF87C3C245D
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:07:00 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 39721600A0E
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:07:00 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 94AA74049F
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626178019;
 bh=ERtqxdZIeKee7Pz1TynyR+x/oHzoVx1XFGSPFE8KfWM=;
 h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type;
 b=NLNRpXZ2nrkbwHq7UHAdilCKoAzFe8OkgcpKPmBdk+8RmWuRgpykWZ9WKF5goMMsW
 JPF4DZgca+FcZRSuqSyLIV/OAg6SmKtTBk10+Vv/g1Wc92zCvXcfmGC3B8nq9pO/Th
 jat8aUG8WACT8Tuj5t4td8VfRSEBr5txeoeQiL5nmzRU2nBPMwZxz2k8C/dBNf6F4q
 jWh8nJDoN+CWV08CyD6WDDSgLXGsIW37vvfW9oqApMpzs3XuCF/UlqAqoBaii6GGY7
 LsZ8HXfgp2MkYVQVeyGqEWNQcOE9QOw/Gkv2yBxcgOkxDC52yv+JejwVRpvQ+6AJMm
 bw0qY7G7+DwgQ==
Received: by mail-ed1-f72.google.com with SMTP id
 s6-20020a0564020146b029039578926b8cso11778007edu.20
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 05:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ERtqxdZIeKee7Pz1TynyR+x/oHzoVx1XFGSPFE8KfWM=;
 b=cnDnFsA8nJ6O/xVolIaU414UgtzT+w8k769/dbA65WcY9i8WpeNrGyi4pBdicNj5jG
 iHs85pbiOkBxkGmItwh9ER4s8mX+iPPODvYq0Z59RMT+dCbwd1k0OSna9gf+Qjb8+mxz
 GMmA0FNzHIbPYxZlX+SXWR1YMgupwVslElBg6mSLaXYw5DiLJ+A6KoWul5zfUDvFJMsJ
 m4bTrromtjQ5NZjQCt5Vqsk/dAOSRrpj8IybiTzDLCT46L8Bh/vDw0oFooUrjs5Kw7O3
 +V/KrXejD0kJMVF5wc5VZemCl41KXd8PfJT8eAx57mNB204373l5gVjnsPiS+7185Gh5
 j7uQ==
X-Gm-Message-State: AOAM533fmOVp1/9KN1DXagnaEG4N8xN/zPqKsSryHZ+JsnXwvIAGiRie
 iqIwimqLR9vR8HEpXJSUFFXsE0EXoesr4ZVspGW0lb2d6EEjhDk/0a+ZKf1tXOa2dmradkKdamO
 MSld9IuCzUvVOkZ0cCYg9uPkedc+2
X-Received: by 2002:a17:906:e088:: with SMTP id
 gh8mr5214353ejb.125.1626178019066; 
 Tue, 13 Jul 2021 05:06:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5SqdyQpelSHMw3mbWzE3WHgDYHbI8f00tRtyvLAsGsBavHYUrVfwKvA5nV261AnnKEG56hQ==
X-Received: by 2002:a17:906:e088:: with SMTP id
 gh8mr5214331ejb.125.1626178018867; 
 Tue, 13 Jul 2021 05:06:58 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id t17sm9444461edv.75.2021.07.13.05.06.58
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 05:06:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
References: <9c05b592-e474-6a3e-2dc1-ec075a0bc558@canonical.com>
Message-ID: <632cda7e-fe23-a0b6-cad8-4bd3aceac1d3@canonical.com>
Date: Tue, 13 Jul 2021 14:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9c05b592-e474-6a3e-2dc1-ec075a0bc558@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Failing test on failing shell commands
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

T24gMTMvMDcvMjAyMSAxMzo1NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiAKPiBIaSBh
bGwsCj4gCj4gSSBoYXZlIGEgZmFpbGluZyBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgKGluCj4g
dGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsLykgd2hpY2ggaGl0
cyB1bmV4cGVjdGVkCj4gT09NIG9uIG9uZSBvZiBlYXJsaWVyIGNvbW1hbmRzLCBhbHJlYWR5IGlu
IHRoZSB0ZXN0Ogo+IAo+ICAxOCAgICAgICAgIGVjaG8gMSA+IG1lbW9yeS51c2VfaGllcmFyY2h5
Cj4gIDE5ICAgICAgICAgZWNobyAkUEFHRVNJWkUgPiBtZW1vcnkubGltaXRfaW5fYnl0ZXMKPiAg
MjAgCj4gIDIxICAgICAgICAgbWtkaXIgc3ViZ3JvdXAgIAo+IG1rZGlyOiBjYW5ub3QgY3JlYXRl
IGRpcmVjdG9yeSDigJhzdWJncm91cOKAmTogQ2Fubm90IGFsbG9jYXRlIG1lbW9yeQo+IC9ob21l
L3VidW50dS9sdHAtaW5zdGFsbC90ZXN0Y2FzZXMvYmluL21lbWNnX3VzZV9oaWVyYXJjaHlfdGVz
dC5zaDogMjI6IGNkOiBjYW4ndCBjZCB0byBzdWJncm91cAo+IAo+IFRoZSBjb21tYW5kIGRpZCBu
b3QgZmFpbCwgYXMgdGhlcmUgaXMgbm8gInNldCAtZSIgYW5kIHRlc3QgZmFpbHMgbGF0ZXIuCgpB
aCwgSSB3YW50ZWQgdG8gc2F5OgoiVGhlIGNvbW1hbmQgZGlkIG5vdCBmYWlsIGVudGlyZSB0ZXN0
LCBhcyB0aGVyZSBpcyBubyAic2V0IC1lIiBhbmQgdGVzdApmYWlscyBsYXRlci4iCgo+IEhvd2V2
ZXIgdGhlcmUgY291bGQgYmUgYSBjYXNlIHdoZXJlIHN1Y2ggZmFpbHVyZSBkb2VzIG5vdCB0cmln
Z2VyIGxhdGVyCj4gaXNzdWUgYW5kIHRlc3QgaXMgYSBmYWxzZS1wb3NpdGl2ZS4KPiAKPiBXaGF0
IGlzIHRoZSBwcmFjdGljZSBmb3IgTFRQIHNoZWxsIHRlc3RzIHRvIGhhbmRsZSBraW5kIG9mIHBy
ZXBhcmF0aW9uCj4gY29tbWFuZHM/IE1heWJlIHRoaXMgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtl
Ogo+IAo+IC0tLS0tLS0tCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJv
bGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ191c2VfaGllcmFyY2h5X3Rlc3Quc2ggYi90ZXN0
Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfdXNlX2hpZXJh
cmNoeV90ZXN0LnNoCj4gaW5kZXggOGJlMzQyNDk5ZWNlLi5mOGRkODk0NmY4MGIgMTAwNzU1Cj4g
LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNn
X3VzZV9oaWVyYXJjaHlfdGVzdC5zaAo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxl
cnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ191c2VfaGllcmFyY2h5X3Rlc3Quc2gKPiBAQCAtMTgs
OCArMTgsOCBAQCB0ZXN0MSgpCj4gICAgICAgICBlY2hvIDEgPiBtZW1vcnkudXNlX2hpZXJhcmNo
eQo+ICAgICAgICAgZWNobyAkUEFHRVNJWkUgPiBtZW1vcnkubGltaXRfaW5fYnl0ZXMKPiAgCj4g
LSAgICAgICBta2RpciBzdWJncm91cAo+IC0gICAgICAgY2Qgc3ViZ3JvdXAKPiArICAgICAgIEVY
UEVDVF9QQVNTIG1rZGlyIHN1Ymdyb3VwCj4gKyAgICAgICBFWFBFQ1RfUEFTUyBjZCBzdWJncm91
cAo+ICAgICAgICAgdGVzdF9wcm9jX2tpbGwgJCgoUEFHRVNJWkUgKiAzKSkgIi0tbW1hcC1sb2Nr
MSIgJCgoUEFHRVNJWkUgKiAyKSkgMAo+ICAKPiAgICAgICAgIGNkIC4uCj4gCj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgo+IAoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
