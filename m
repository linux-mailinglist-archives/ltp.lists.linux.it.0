Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E26F0A56
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Apr 2023 18:57:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B57D3CE939
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Apr 2023 18:57:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 927F63CC012
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 18:57:39 +0200 (CEST)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 217E11000A23
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 18:57:39 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-3ef31924c64so759121cf.1
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682614658; x=1685206658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWXSnVBDILgJA2YsGqrMEMmTOSzXQQByZGYj/mfV8v0=;
 b=zhEhEXe4wcKKfzXnjicPIWO9hMh1w5PKsdHtD0LJ/9OH9+B4bGNw44jah7T2qo32jo
 InrN2d6Y54Db1BCD+lKNT3PkTOfUFith0o3RESOIofMv5M0f3/a1ShqjR7DgwMslVM6G
 bfnC0iiZVofwhsnQGJLJGJS66DrXfB627Tqemye02muFTB/7495d7sJVsfUXCCNi5lZc
 mfGAbm3ChN6YTZjkoMM/CW2wS51P8Y7h8dKWgYwhHErOAb7WLwJGdFkric6+fjzgEAkv
 Hwv9gSQLPtHfLTLwHQlMN2nkYi0O6RiwR4gN3g0FHgaXHFZEVPMmVKjyM9BYvFRIL7UE
 Qnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682614658; x=1685206658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWXSnVBDILgJA2YsGqrMEMmTOSzXQQByZGYj/mfV8v0=;
 b=R6WRe4hORm6ED21DYaa3KO0H7xAZIH+a6uhq/0zSMq/lfWh5o2PjPdW8VmQxaJjRN6
 Gj/VNJ5agCncKQ6hK7qknJQMTQxiu7aYKukzO2ZWPU6qqalJU1BQQSSwPqMIdP3Jj30f
 kSbgpn1ohA/9pEoiWfOq7YVnkwv4OHfojCENMqPEcmAUSiBr6yxpAHe7gXlN796+yUGj
 +LOG2uizDYndfIfN3Iid2eHFYvfQNba6XTIFyp29U9dSqXmxTA39fPSLabBKe1pboVnv
 BTjbqAkuUhWprZA+7kzxT//SXy2MXiqFr7dF//zEfi3vmQlo/pLVVB+8YbBeIbnAfY5X
 1Wxw==
X-Gm-Message-State: AC+VfDyvXfbOirKxTiJ3JjjkdGbbW3dlIy1cWwowj9PteR2Lca+Cqsa0
 YiKEaTiHFirAPGbfTKrO0Ul4pGy5xfPdLq5kX8hPCQ==
X-Google-Smtp-Source: ACHHUZ44Zw4Ujk95w8M/YYo5X7fHkfkmnDLOHK6DwPvDAv4xzrfJGMUuKGWtjm52SN23SRe66g0oqfcfXoo7x8tAjnw=
X-Received: by 2002:ac8:5794:0:b0:3ef:302c:319e with SMTP id
 v20-20020ac85794000000b003ef302c319emr377509qta.8.1682614657806; Thu, 27 Apr
 2023 09:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230427002905.1354207-1-edliaw@google.com>
 <20230427002905.1354207-2-edliaw@google.com>
 <87jzxxejxg.fsf@suse.de>
In-Reply-To: <87jzxxejxg.fsf@suse.de>
Date: Thu, 27 Apr 2023 09:57:11 -0700
Message-ID: <CAG4es9UeHN3jNqnc0Tp14vj=2ZscMucobMSJMe=qqPAwd0fEUA@mail.gmail.com>
To: rpalethorpe@suse.de
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] fcntl{34,
 36}: Only use fcntl64 with 32bit abi
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBBcHIgMjcsIDIwMjMgYXQgMjo0N+KAr0FNIFJpY2hhcmQgUGFsZXRob3JwZSA8cnBh
bGV0aG9ycGVAc3VzZS5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IEVkd2FyZCBMaWF3IHZpYSBs
dHAgPGx0cEBsaXN0cy5saW51eC5pdD4gd3JpdGVzOgo+Cj4gPiBGaXhlczogNzY0MzExNWFhYWNi
ICgiZmNudGx7MzQsMzZ9OiBBbHdheXMgdXNlIDY0LWJpdCBmbG9jayBzdHJ1Y3QgdG8gYXZvaWQg
RUlOVkFMIikKPiA+Cj4gPiBPbiBBbmRyb2lkIGFybTY0LCB0c3Rfa2VybmVsX2JpdHMgaXMgZGlz
cmVnYXJkaW5nIHRoZSBhYmksIHNvIGNvbXBpbGluZwo+ID4gd2l0aCB0aGUgMzJiaXQgYWJpIGlz
IGNhbGxpbmcgdGhlIGZjbnRsIHN5c2NhbGwgaW5zdGVhZCBvZiBmY250bDY0Lgo+ID4gVGhlCj4K
PiBJSVJDIHRoYXQncyB0aGUgaWRlYSBiZWNhdXNlIGZjbnRsNjQgZG9lc24ndCBleGlzdCBvbiBh
IDY0Yml0Cj4ga2VybmVsLgo+Cj4gU28gaWYgeW91IGNvbXBpbGUgdGhlIHRlc3Qgd2l0aCAtbTMy
LzMyYml0IEFCSSBvbiB4ODZfNjQgNjRiaXQga2VybmVsCj4gdGhlbiB5b3Ugd2lsbCBnZXQgRU5P
U1lTPyBJZiBub3QgdGhlbiBJIHN1cHBvc2UgaXQgaXMgZmluZS4KCkkgZGlkIG5vdCBnZXQgRU5P
U1lTLiAgSSBjaGVja2VkIHdpdGggc3RyYWNlIGFuZCBteSB4ODZfNjQgYml0IGtlcm5lbApkb2Vz
IGFwcGVhciB0byBoYXZlIGZjbnRsNjQgd2hlbiBjb21waWxlZCB3aXRoIC1tMzIuICBJJ20gbm90
IHN1cmUgaWYKdGhhdCdzIGFsd2F5cyB0aGUgY2FzZSwgdGhvdWdoLiAgSSBjaGVja2VkIHdpdGgg
dGhlIG90aGVyIGZjbnRsIHRlc3RzCmFuZCB0aGV5IGFsc28gYXBwZWFyIHRvIGNhbGwgZmNudGw2
NCB3aXRoIHRoZSAzMiBiaXQgYWJpLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
