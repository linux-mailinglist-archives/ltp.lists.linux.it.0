Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF23EA020
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7EC13C6D00
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86A173C2E09
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:23 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E0D66600198
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:22 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 36C083F04D
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628755402;
 bh=UhjchgatRmk5OThF4z1T03ITOSL2vufMdD6HgyJmkqM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=IYWd2Tb5zMfx4k0aZlO0aLKmMQ5CqEoVhVULFTwEsazDO+8YIOILgtqB2UVkU9SUR
 hOZ150/iE5zgLa5CI6bCUHGXQ1XoNozRZmiTuANSByOEkdXaKp4H4QbqtvgGmWpTFn
 M4MtM3PMaGEjYGAmb7JZp/8jWt3fFfJBewWL4rB3HMqRsLCZ8e2VylVYfMgTnx1L/4
 WOYrHLIxyZFMv3JE0V6sCVmorYqfdET+JM3vjM64RiLU7NOsXTNJU6g9o++wskuzSH
 bgKPFmcHFJUSI23+jLxHBM0SPXKQLEJA3qCd2mO1r5QafkS+/7P6ExwrUA4pZvWac7
 SXbtVXN7mCQiw==
Received: by mail-ed1-f71.google.com with SMTP id
 v20-20020aa7d9d40000b02903be68450bf3so2661682eds.23
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 01:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhjchgatRmk5OThF4z1T03ITOSL2vufMdD6HgyJmkqM=;
 b=OLG/ttaat+tQBXPZf6yE/j4BiZHlsH2ZaGHQPJFVdQ99Fcl5tzsefubhti1/E7Co9e
 fEhc9GuXTHw8xTZqDFnLovzoSYD+KULi9JRwwpkJE89T51MG70aTctQDPCNKpmpkdAWS
 1ei21FT2b/gtbZgPwZs7tIGn1Yfhjz1crzicgsDxvWxNgeQiE8RGgqGPR4vT6OmdBnOz
 tPM8NcMP1XESydyjHUzxlLQNQc4DPICN58o6+yPS/SEoyadKo4B0D04ibT7frquy9LQS
 5tlXIqvuTyv40rNLEnQkaadlb8Mc8KrxkqavTH1Y6sxLXs9Hb4e2SyQQcTD5JvS/UtXY
 sMxA==
X-Gm-Message-State: AOAM533fLZCO0eEj0BzgeJf0Ka2ptDtoLcxdmN3Sed0OyiVwgOrKBeAA
 CO2PcJ1xStIWig4lLUFEgPgDrGkHQhXdvACnmiKjjNlHpzmS+xn4zAUV5zWTzWzt1FEqEK+/bec
 vDSvSqob63udltotjGljmcOTQiYcH
X-Received: by 2002:a17:906:5d06:: with SMTP id
 g6mr2424774ejt.96.1628755401689; 
 Thu, 12 Aug 2021 01:03:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTX69X8II3Spa8cBebRjkPDbeI5LVOh0LnZP4Fu64b1UMZ63S0rODQ5HcI91Y68N/p0vo3ig==
X-Received: by 2002:a17:906:5d06:: with SMTP id
 g6mr2424758ejt.96.1628755401490; 
 Thu, 12 Aug 2021 01:03:21 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm759114edv.78.2021.08.12.01.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 01:03:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 12 Aug 2021 10:02:39 +0200
Message-Id: <20210812080242.16972-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210812080242.16972-1-krzysztof.kozlowski@canonical.com>
References: <20210812080242.16972-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] controllers/memcg: account per-node kernel
 memory
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

UmVjZW50IExpbnV4IGtlcm5lbHMgY2hhcmdlIGdyb3VwcyBhbHNvIHdpdGgga2VybmVsIG1lbW9y
eS4gIFRoaXMgaXMgbm90CmxpbWl0ZWQgb25seSB0byBwcm9jZXNzLWFsbG9jYXRlZCBtZW1vcnkg
YnV0IGFsc28gY2dyb3VwLWhhbmRsaW5nIGNvZGUKbWVtb3J5IGFzIHdlbGwuCgpGb3IgZXhhbXBs
ZSBzaW5jZSBrZXJuZWwgdjUuOSB3aXRoIGNvbW1pdCAzZTM4ZTBhYWNhOWUgKCJtbTogbWVtY2c6
CmNoYXJnZSBtZW1jZyBwZXJjcHUgbWVtb3J5IHRvIHRoZSBwYXJlbnQgY2dyb3VwIikgY3JlYXRp
bmcgYSBzdWJncm91cApjYXVzZXMgc2V2ZXJhbCBrZXJuZWwgYWxsb2NhdGlvbnMgdG93YXJkcyB0
aGlzIGdyb3VwLgoKVGhlc2UgYWRkaXRpb25hbCBrZXJuZWwgbWVtb3J5IGFsbG9jYXRpb25zIGFy
ZSBwcm9wb3J0aW9uYWwgdG8gbnVtYmVyIG9mCkNQVXMgYW5kIG51bWJlciBvZiBub2Rlcy4KCk9u
IGM0Ljh4bGFyZ2UgQVdTIGluc3RhbmNlIHdpdGggMzYgY29yZXMgaW4gdHdvIG5vZGVzIHdpdGgg
djUuMTEgTGludXgKa2VybmVsIHRoZSBtZW1jZ19zdWJncm91cF9jaGFyZ2UgYW5kIG1lbWNnX3Vz
ZV9oaWVyYXJjaHlfdGVzdCB0ZXN0cyB3ZXJlCmZhaWxpbmc6CgogICAgbWVtY2dfdXNlX2hpZXJh
cmNoeV90ZXN0IDEgVElORk86IHRpbWVvdXQgcGVyIHJ1biBpcyAwaCA1bSAwcwogICAgbWVtY2df
dXNlX2hpZXJhcmNoeV90ZXN0IDEgVElORk86IHNldCAvZGV2L21lbWNnL21lbW9yeS51c2VfaGll
cmFyY2h5IHRvIDAgZmFpbGVkCiAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5GTzog
dGVzdCBpZiBvbmUgb2YgdGhlIGFuY2VzdG9ycyBnb2VzIG92ZXIgaXRzIGxpbWl0LCB0aGUgcHJv
Y2VzIHdpbGwgYmUga2lsbGVkCiAgICBta2RpcjogY2Fubm90IGNyZWF0ZSBkaXJlY3Rvcnkg4oCY
c3ViZ3JvdXDigJk6IENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkKICAgIC9ob21lL3VidW50dS9sdHAt
aW5zdGFsbC90ZXN0Y2FzZXMvYmluL21lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdC5zaDogMjY6IGNk
OiBjYW4ndCBjZCB0byBzdWJncm91cAogICAgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDEgVElO
Rk86IFJ1bm5pbmcgbWVtY2dfcHJvY2VzcyAtLW1tYXAtbG9jazEgLXMgODE5MgogICAgbWVtY2df
dXNlX2hpZXJhcmNoeV90ZXN0IDEgVEZBSUw6IHByb2Nlc3MgIGlzIG5vdCBraWxsZWQKICAgIHJt
ZGlyOiBmYWlsZWQgdG8gcmVtb3ZlICdzdWJncm91cCc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkKClRoZSBrZXJuZWwgd2FzIHVuYWJsZSB0byBjcmVhdGUgdGhlIHN1Ymdyb3VwIChta2RpciBy
ZXR1cm5lZCAtRU5PTUVNKQpkdWUgdG8gdGhpcyBhZGRpdGlvbmFsIHBlci1ub2RlIGtlcm5lbCBt
ZW1vcnkgYWxsb2NhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+Ci0tLQogLi4uL2NvbnRyb2xsZXJzL21l
bWNnL2Z1bmN0aW9uYWwvbWVtY2dfbGliLnNoIHwgMzUgKysrKysrKysrKysrKysrKysrKwogLi4u
L21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfc3ViZ3JvdXBfY2hhcmdlLnNoIHwgIDggKystLS0KIC4u
Li9mdW5jdGlvbmFsL21lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdC5zaCAgICB8ICA2ICsrLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2df
bGliLnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21l
bWNnX2xpYi5zaAppbmRleCBkYWQ2NmM3OThlMTkuLmM4YjVkZjJiNDVmNyAxMDA3NTUKLS0tIGEv
dGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5z
aAorKysgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVt
Y2dfbGliLnNoCkBAIC02Myw2ICs2Myw0MSBAQCBtZW1jZ19yZXF1aXJlX2hpZXJhcmNoeV9kaXNh
YmxlZCgpCiAJZmkKIH0KIAorIyBLZXJuZWwgbWVtb3J5IGFsbG9jYXRlZCBmb3IgdGhlIHByb2Nl
c3MgaXMgYWxzbyBjaGFyZ2VkLiAgSXQgbWlnaHQgZGVwZW5kIG9uCisjIHRoZSBudW1iZXIgb2Yg
Q1BVcyBhbmQgbnVtYmVyIG9mIG5vZGVzLiBGb3IgZXhhbXBsZSBvbiBrZXJuZWwgdjUuMTEKKyMg
YWRkaXRpb25hbGx5IHRvdGFsX2NwdXMgKHBsdXMgMSBvciAyKSBwYWdlcyBhcmUgY2hhcmdlZCB0
byB0aGUgZ3JvdXAgdmlhCisjIGtlcm5lbCBtZW1vcnkuICBGb3IgYSB0d28tbm9kZSBtYWNoaW5l
LCBhZGRpdGlvbmFsIDEwOCBwYWdlcyBrZXJuZWwgbWVtb3J5CisjIGFyZSBjaGFyZ2VkIHRvIHRo
ZSBncm91cC4KKyMKKyMgQWRqdXN0IHRoZSBsaW1pdCB0byBhY2NvdW50IHN1Y2ggcGVyLUNQVSBh
bmQgcGVyLW5vZGUga2VybmVsIG1lbW9yeS4KKyMgJDEgLSBleHBlY3RlZCBjZ3JvdXAgbWVtb3J5
IGxpbWl0IHZhbHVlIHRvIGFkanVzdAorbWVtY2dfYWRqdXN0X2xpbWl0X2Zvcl9rbWVtKCkKK3sK
KwlbICQjIC1uZSAxIF0gJiYgdHN0X2JyayBUQlJPSyAibWVtY2dfYWRqdXN0X2xpbWl0X2Zvcl9r
bWVtIGV4cGVjdHMgMSBwYXJhbWV0ZXIiCisKKwlsb2NhbCBsaW1pdD0kMQorCisJIyBUb3RhbCBu
dW1iZXIgb2YgQ1BVcworCWxvY2FsIHRvdGFsX2NwdXM9YHRzdF9uY3B1c2AKKworCSMgVG90YWwg
bnVtYmVyIG9mIG5vZGVzCisJaWYgWyAhIC1kIC9zeXMvZGV2aWNlcy9zeXN0ZW0vbm9kZS9ub2Rl
MCBdOyB0aGVuCisJCXRvdGFsX25vZGVzPTEKKwllbHNlCisJCXRvdGFsX25vZGVzPWBscyAvc3lz
L2RldmljZXMvc3lzdGVtL25vZGUvIHwgZ3JlcCAtYyAibm9kZVswLTldWzAtOV0qImAKKwlmaQor
CisJbG9jYWwgbm9kZV9tZW09MAorCWlmIFsgJHRvdGFsX25vZGVzIC1ndCAxIF07IHRoZW4KKwkJ
bm9kZV9tZW09JCgodG90YWxfbm9kZXMgLSAxKSkKKwkJbm9kZV9tZW09JCgobm9kZV9tZW0gKiBQ
QUdFU0laRSAqIDEyOCkpCisJZmkKKworCWxpbWl0PSQoKGxpbWl0ICsgNCAqIFBBR0VTSVpFICsg
dG90YWxfY3B1cyAqIFBBR0VTSVpFICsgbm9kZV9tZW0pKQorCisJZWNobyAkbGltaXQKK30KKwog
bWVtY2dfc2V0dXAoKQogewogCWlmICEgaXNfY2dyb3VwX3N1YnN5c3RlbV9hdmFpbGFibGVfYW5k
X2VuYWJsZWQgIm1lbW9yeSI7IHRoZW4KZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY29u
dHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19zdWJncm91cF9jaGFyZ2Uuc2ggYi90ZXN0
Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfc3ViZ3JvdXBf
Y2hhcmdlLnNoCmluZGV4IDBkMmIyMzVhZmY3Yy4uNDRmYzczNzBlZWZmIDEwMDc1NQotLS0gYS90
ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfc3ViZ3Jv
dXBfY2hhcmdlLnNoCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVu
Y3Rpb25hbC9tZW1jZ19zdWJncm91cF9jaGFyZ2Uuc2gKQEAgLTI0LDE2ICsyNCwxMiBAQCB0ZXN0
X3N1Ymdyb3VwKCkKIHsKIAlsb2NhbCBsaW1pdF9wYXJlbnQ9JDEKIAlsb2NhbCBsaW1pdF9zdWJn
cm91cD0kMgotCWxvY2FsIHRvdGFsX2NwdXM9YHRzdF9uY3B1c2AKIAotCSMgS2VybmVsIG1lbW9y
eSBhbGxvY2F0ZWQgZm9yIHRoZSBwcm9jZXNzIGlzIGFsc28gY2hhcmdlZC4KLQkjIEl0IG1pZ2h0
IGRlcGVuZCBvbiB0aGUgbnVtYmVyIG9mIENQVXMuIEZvciBleGFtcGxlIG9uIGtlcm5lbCB2NS4x
MQotCSMgYWRkaXRpb25hbGx5IHRvdGFsX2NwdXMgcGx1cyAxLTIgcGFnZXMgYXJlIGNoYXJnZWQg
dG8gdGhlIGdyb3VwLgogCWlmIFsgJGxpbWl0X3BhcmVudCAtbmUgMCBdOyB0aGVuCi0JCWxpbWl0
X3BhcmVudD0kKChsaW1pdF9wYXJlbnQgKyA0ICogUEFHRVNJWkUgKyB0b3RhbF9jcHVzICogUEFH
RVNJWkUpKQorCQlsaW1pdF9wYXJlbnQ9JChtZW1jZ19hZGp1c3RfbGltaXRfZm9yX2ttZW0gJGxp
bWl0X3BhcmVudCkKIAlmaQogCWlmIFsgJGxpbWl0X3N1Ymdyb3VwIC1uZSAwIF07IHRoZW4KLQkJ
bGltaXRfc3ViZ3JvdXA9JCgobGltaXRfc3ViZ3JvdXAgKyA0ICogUEFHRVNJWkUgKyB0b3RhbF9j
cHVzICogUEFHRVNJWkUpKQorCQlsaW1pdF9zdWJncm91cD0kKG1lbWNnX2FkanVzdF9saW1pdF9m
b3Jfa21lbSAkbGltaXRfc3ViZ3JvdXApCiAJZmkKIAogCW1rZGlyIHN1Ymdyb3VwCmRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2df
dXNlX2hpZXJhcmNoeV90ZXN0LnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1j
Zy9mdW5jdGlvbmFsL21lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdC5zaAppbmRleCA4YmUzNDI0OTll
Y2UuLjEyOWY5MWIxNGMwYSAxMDA3NTUKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVy
cy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdC5zaAorKysgYi90ZXN0
Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfdXNlX2hpZXJh
cmNoeV90ZXN0LnNoCkBAIC0xNSwxMiArMTUsMTQgQEAgdGVzdDEoKQogewogCXRzdF9yZXMgVElO
Rk8gInRlc3QgaWYgb25lIG9mIHRoZSBhbmNlc3RvcnMgZ29lcyBvdmVyIGl0cyBsaW1pdCwgdGhl
IHByb2NlcyB3aWxsIGJlIGtpbGxlZCIKIAorCWxvY2FsIGxpbWl0PSQobWVtY2dfYWRqdXN0X2xp
bWl0X2Zvcl9rbWVtICRQQUdFU0laRSkKKwogCWVjaG8gMSA+IG1lbW9yeS51c2VfaGllcmFyY2h5
Ci0JZWNobyAkUEFHRVNJWkUgPiBtZW1vcnkubGltaXRfaW5fYnl0ZXMKKwllY2hvICRsaW1pdCA+
IG1lbW9yeS5saW1pdF9pbl9ieXRlcwogCiAJbWtkaXIgc3ViZ3JvdXAKIAljZCBzdWJncm91cAot
CXRlc3RfcHJvY19raWxsICQoKFBBR0VTSVpFICogMykpICItLW1tYXAtbG9jazEiICQoKFBBR0VT
SVpFICogMikpIDAKKwl0ZXN0X3Byb2Nfa2lsbCAkKChsaW1pdCArIFBBR0VTSVpFICogMykpICIt
LW1tYXAtbG9jazEiICQoKGxpbWl0ICsgUEFHRVNJWkUgKiAyKSkgMAogCiAJY2QgLi4KIAlybWRp
ciBzdWJncm91cAotLSAKMi4zMC4yCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
