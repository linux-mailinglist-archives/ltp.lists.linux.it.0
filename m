Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F409492E4D2
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2024 12:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1720694024; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=UQhcChcVF6OYl5I6CaEtarmuWUTyd0ptHu6RGTGzbzk=;
 b=C+UnY2ilj/KvotKq974WDvF5dHRnqR85IYxO96j7T5OWo+vUz+xqb2ZsEDrxzdmH0n3ZC
 zrErgYObGlqWaP9DZ/JUkV9SX2MUU3kfjuh0E9UY6mMbJe5KUciiNdvAHtb4+SGgW2OLpx2
 X2otpiVNgPkWpzpzuHOf8XGTzVx0Qs4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B32F23C1037
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2024 12:33:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F07D33C1037
 for <ltp@lists.linux.it>; Thu, 11 Jul 2024 12:33:30 +0200 (CEST)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5EAC01408F8F
 for <ltp@lists.linux.it>; Thu, 11 Jul 2024 12:33:28 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5956fbe6d0dso929772a12.1
 for <ltp@lists.linux.it>; Thu, 11 Jul 2024 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1720694008; x=1721298808; darn=lists.linux.it;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lL3Rej5s41oeXmW/3/e+dRIqGbf7+3MdekRfwoDu7gA=;
 b=AK4dLZuB+QMe3tYvSreyhzc/whLxpsTzSpxAcgrCZe6EK9S8yQ7BjZAyPXnF+4ENPf
 ukQZVCDEO7YVT00GWc5ywO6iNjfihMHvxzBIzXl79nF4QPoPVqeh1X6zwcP93QFzhZl4
 mKoM+SQ19FUXOG+P8JBvfj4i68+Iua2geZI/8Jgz6CKtC16qxlRrlKrfnmbiVE9WaILr
 bZzvBsAQqdgfvl+OkXUlYDgAgdlCBcDchqCAJEsvWP/nRVE4OP2FKFOP9VGn3WKoDZgT
 yHC3s1+AArPOZbd7NT+dkKlzgEKxIxUEQzY8ZT3618NRVTUpMvcqR2qEd9x4yxAWk8if
 aFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720694008; x=1721298808;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lL3Rej5s41oeXmW/3/e+dRIqGbf7+3MdekRfwoDu7gA=;
 b=JnsMgyXoH0g8Tb9HY7DtHAO6AC2IWM9uo2i4GmyxLwluQCU1dRwwpJ/L/ZkbKvyxIt
 3t9ltOuXsVJxYnrs9n4YiEYc8iGNCOuxOAkRBronUBokNmCmDxPGuQE2s1jZ/bGYS3xy
 iZgUAtDbcoFFNpk4StQ/TsdiU7JUvPJDwAmm24VAKzQMjYo35l2ERc0cDmmgWtEZCde1
 E6k2+eT3wZ0e7aMfTA0lM1KO+IHSEuaYN/Ee1OhLUWXx6g9HhjFawe9FfkBwXdftCiT2
 2AGWvzW9MgqbbHhR/AVSCrOQEJeTbJfQgDxmuhVZE7p+Hheholbh7iGcav5YCfG3dVgR
 W42g==
X-Gm-Message-State: AOJu0YyaCybX+ei7QnPlNyWMGzSdvN+MAyMtShrp3LpfBtsC+ONs4bYp
 lDepGlOCnmV8IDma50KK6yhunJYN8LPeexL434v7zZY100wobOAZ+OZqdZKHAGufYBfu4YGqVh9
 Ffbc=
X-Google-Smtp-Source: AGHT+IG29YsAkdhofMnuZLvEn8DkftC5kTV621/5S9+aOEK37w6KeMKbQWYuJPRSU3bo9fHB8eNmRQ==
X-Received: by 2002:a05:6402:2794:b0:58d:ebf9:4e2b with SMTP id
 4fb4d7f45d1cf-594ba98f46bmr5535294a12.2.1720694006998; 
 Thu, 11 Jul 2024 03:33:26 -0700 (PDT)
Received: from [10.232.133.69] ([88.128.88.11])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc7c9e78sm3293626a12.57.2024.07.11.03.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 03:33:26 -0700 (PDT)
Message-ID: <bddb07dc-d8a2-4946-bfba-8f476bc24613@suse.com>
Date: Thu, 11 Jul 2024 12:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Wang <liwang@redhat.com>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240710-landlock-v2-0-ff79db017d57@suse.com>
 <20240710-landlock-v2-9-ff79db017d57@suse.com>
 <CAEemH2crUwPREXw=QTWSNEUk-_cs0vLeg_VYAgyBuUe5Cet3ow@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAEemH2crUwPREXw=QTWSNEUk-_cs0vLeg_VYAgyBuUe5Cet3ow@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v2 09/11] Add landlock04 test
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gNy8xMS8yNCAxMTozMywgTGkgV2FuZyB3cm90ZToKPgo+Cj4gT24gVGh1LCBKdWwgMTEsIDIw
MjQgYXQgMjowNeKAr0FNIEFuZHJlYSBDZXJ2ZXNhdG8gCj4gPGFuZHJlYS5jZXJ2ZXNhdG9Ac3Vz
ZS5kZT4gd3JvdGU6Cj4KPiAgICAgRnJvbTogQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNlcnZl
c2F0b0BzdXNlLmNvbT4KPgo+ICAgICBUaGlzIHRlc3QgdmVyaWZpZXMgdGhhdCBhbGwgbGFuZGxv
Y2sgcnVsZXMgYXJlIHdvcmtpbmcgcHJvcGVybHkuCj4gICAgIFRoZSB3YXkgd2UgZG8gaXQgaXMg
dG8gdmVyaWZ5IHRoYXQgYWxsIGRpc2FibGVkIHN5c2NhbGxzIGFyZSBub3QKPiAgICAgd29ya2lu
ZyBidXQgdGhlIG9uZSB3ZSBlbmFibGVkIHZpYSBzcGVjaWZjIGxhbmRsb2NrIHJ1bGVzLgo+Cj4g
ICAgIFNpZ25lZC1vZmYtYnk6IEFuZHJlYSBDZXJ2ZXNhdG8gPGFuZHJlYS5jZXJ2ZXNhdG9Ac3Vz
ZS5jb20+Cj4gICAgIC0tLQo+ICAgICDCoHJ1bnRlc3Qvc3lzY2FsbHPCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDEgKwo+ICAgICDCoHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFuZGxvY2svLmdpdGlnbm9yZcKgIMKgIMKgIHzCoCDC
oDIgKwo+ICAgICDCoHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFuZGxvY2svbGFuZGxvY2sw
NC5jwqAgwqAgfCAxNzYgKysrKysrKysrKysKPiAgICAgwqB0ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2xhbmRsb2NrL2xhbmRsb2NrX2V4ZWMuYyB8wqAgwqA5ICsKPiAgICAgwqAuLi4va2VybmVs
L3N5c2NhbGxzL2xhbmRsb2NrL2xhbmRsb2NrX3Rlc3Rlci5owqAgwqAgwqB8IDM1MAo+ICAgICAr
KysrKysrKysrKysrKysrKysrKysKPiAgICAgwqA1IGZpbGVzIGNoYW5nZWQsIDUzOCBpbnNlcnRp
b25zKCspCj4KPiAgICAgZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5
c2NhbGxzCj4gICAgIGluZGV4IDI2OWNmMjRiMS4uMTBiNTRhZTg0IDEwMDY0NAo+ICAgICAtLS0g
YS9ydW50ZXN0L3N5c2NhbGxzCj4gICAgICsrKyBiL3J1bnRlc3Qvc3lzY2FsbHMKPiAgICAgQEAg
LTY4Nyw2ICs2ODcsNyBAQCBraWxsMTMga2lsbDEzCj4gICAgIMKgbGFuZGxvY2swMSBsYW5kbG9j
azAxCj4gICAgIMKgbGFuZGxvY2swMiBsYW5kbG9jazAyCj4gICAgIMKgbGFuZGxvY2swMyBsYW5k
bG9jazAzCj4gICAgICtsYW5kbG9jazA0IGxhbmRsb2NrMDQKPgo+ICAgICDCoGxjaG93bjAxIGxj
aG93bjAxCj4gICAgIMKgbGNob3duMDFfMTYgbGNob3duMDFfMTYKPiAgICAgZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFuZGxvY2svLmdpdGlnbm9yZQo+ICAgICBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFuZGxvY2svLmdpdGlnbm9yZQo+ICAgICBpbmRleCBm
NzljZDA5MGIuLjRmZThkN2NiYSAxMDA2NDQKPiAgICAgLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9sYW5kbG9jay8uZ2l0aWdub3JlCj4gICAgICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvbGFuZGxvY2svLmdpdGlnbm9yZQo+ICAgICBAQCAtMSwzICsxLDUgQEAKPiAgICAg
K2xhbmRsb2NrX2V4ZWMKPiAgICAgwqBsYW5kbG9jazAxCj4gICAgIMKgbGFuZGxvY2swMgo+ICAg
ICDCoGxhbmRsb2NrMDMKPiAgICAgK2xhbmRsb2NrMDQKPiAgICAgZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFuZGxvY2svbGFuZGxvY2swNC5jCj4gICAgIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9sYW5kbG9jay9sYW5kbG9jazA0LmMKPiAgICAgbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiAgICAgaW5kZXggMDAwMDAwMDAwLi4xNTY3MzI4YmIKPiAgICAgLS0tIC9k
ZXYvbnVsbAo+ICAgICArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xhbmRsb2NrL2xh
bmRsb2NrMDQuYwo+ICAgICBAQCAtMCwwICsxLDE3NiBAQAo+ICAgICArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiAgICAgKy8qCj4gICAgICsgKiBDb3B5cmln
aHQgKEMpIDIwMjQgU1VTRSBMTEMgQW5kcmVhIENlcnZlc2F0bwo+ICAgICA8YW5kcmVhLmNlcnZl
c2F0b0BzdXNlLmNvbT4KPiAgICAgKyAqLwo+ICAgICArCj4gICAgICsvKlwKPiAgICAgKyAqIFtE
ZXNjcmlwdGlvbl0KPiAgICAgKyAqCj4gICAgICsgKiBUaGlzIHRlc3QgdmVyaWZpZXMgdGhhdCBh
bGwgbGFuZGxvY2sgcnVsZXMgYXJlIHdvcmtpbmcKPiAgICAgcHJvcGVybHkuIFRoZSB3YXkgd2UK
PiAgICAgKyAqIGRvIGl0IGlzIHRvIHZlcmlmeSB0aGF0IGFsbCBkaXNhYmxlZCBzeXNjYWxscyBh
cmUgbm90IHdvcmtpbmcKPiAgICAgYnV0IHRoZSBvbmUgd2UKPiAgICAgKyAqIGVuYWJsZWQgdmlh
IHNwZWNpZmMgbGFuZGxvY2sgcnVsZXMuCj4gICAgICsgKi8KPiAgICAgKwo+ICAgICArI2luY2x1
ZGUgImxhbmRsb2NrX2NvbW1vbi5oIgo+ICAgICArI2luY2x1ZGUgImxhbmRsb2NrX3Rlc3Rlci5o
Igo+ICAgICArCj4gICAgICsjZGVmaW5lIEFDQ0VTU19OQU1FKHgpICN4Cj4gICAgICsKPiAgICAg
K3N0YXRpYyBzdHJ1Y3QgbGFuZGxvY2tfcnVsZXNldF9hdHRyICpydWxlc2V0X2F0dHI7Cj4gICAg
ICtzdGF0aWMgc3RydWN0IGxhbmRsb2NrX3BhdGhfYmVuZWF0aF9hdHRyICpwYXRoX2JlbmVhdGhf
YXR0cjsKPiAgICAgKwo+ICAgICArc3RydWN0IHJ1bGVfYWNjZXNzIHsKPiAgICAgK8KgIMKgIMKg
IMKgY2hhciAqcGF0aDsKPiAgICAgK8KgIMKgIMKgIMKgaW50IGFjY2VzczsKPiAgICAgK307Cj4g
ICAgICsKPiAgICAgK3N0YXRpYyBzdHJ1Y3QgdHZhcmlhbnQgewo+ICAgICArwqAgwqAgwqAgwqBp
bnQgYWNjZXNzOwo+ICAgICArwqAgwqAgwqAgwqBjaGFyICpkZXNjOwo+ICAgICArfSB0dmFyaWFu
dHNbXSA9IHsKPiAgICAgK8KgIMKgIMKgIMKgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBMQU5ETE9DS19BQ0NFU1NfRlNfUkVBRF9GSUxFIHwKPiAgICAgTEFORExPQ0tfQUNDRVNTX0ZT
X0VYRUNVVEUsCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFDQ0VTU19OQU1FKExBTkRM
T0NLX0FDQ0VTU19GU19FWEVDVVRFKQo+ICAgICArwqAgwqAgwqAgwqB9LAo+ICAgICArwqAgwqAg
wqAgwqB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoExBTkRMT0NLX0FDQ0VTU19GU19X
UklURV9GSUxFLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBQ0NFU1NfTkFNRShMQU5E
TE9DS19BQ0NFU1NfRlNfV1JJVEVfRklMRSkKPiAgICAgK8KgIMKgIMKgIMKgfSwKPiAgICAgK8Kg
IMKgIMKgIMKgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBMQU5ETE9DS19BQ0NFU1Nf
RlNfUkVBRF9GSUxFLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBQ0NFU1NfTkFNRShM
QU5ETE9DS19BQ0NFU1NfRlNfUkVBRF9GSUxFKQo+ICAgICArwqAgwqAgwqAgwqB9LAo+ICAgICAr
wqAgwqAgwqAgwqB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoExBTkRMT0NLX0FDQ0VT
U19GU19SRUFEX0RJUiwKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQUNDRVNTX05BTUUo
TEFORExPQ0tfQUNDRVNTX0ZTX1JFQURfRElSKQo+ICAgICArwqAgwqAgwqAgwqB9LAo+ICAgICAr
wqAgwqAgwqAgwqB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoExBTkRMT0NLX0FDQ0VT
U19GU19SRU1PVkVfRElSLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBQ0NFU1NfTkFN
RShMQU5ETE9DS19BQ0NFU1NfRlNfUkVNT1ZFX0RJUikKPiAgICAgK8KgIMKgIMKgIMKgfSwKPiAg
ICAgK8KgIMKgIMKgIMKgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBMQU5ETE9DS19B
Q0NFU1NfRlNfUkVNT1ZFX0ZJTEUsCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFDQ0VT
U19OQU1FKExBTkRMT0NLX0FDQ0VTU19GU19SRU1PVkVfRklMRSkKPiAgICAgK8KgIMKgIMKgIMKg
fSwKPiAgICAgK8KgIMKgIMKgIMKgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBMQU5E
TE9DS19BQ0NFU1NfRlNfTUFLRV9DSEFSLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBB
Q0NFU1NfTkFNRShMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9DSEFSKQo+ICAgICArwqAgwqAgwqAg
wqB9LAo+ICAgICArwqAgwqAgwqAgwqB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoExB
TkRMT0NLX0FDQ0VTU19GU19NQUtFX0JMT0NLLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBBQ0NFU1NfTkFNRShMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9CTE9DSykKPiAgICAgK8KgIMKg
IMKgIMKgfSwKPiAgICAgK8KgIMKgIMKgIMKgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9SRUcsCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoEFDQ0VTU19OQU1FKExBTkRMT0NLX0FDQ0VTU19GU19NQUtFX1JFRykKPiAgICAgK8KgIMKg
IMKgIMKgfSwKPiAgICAgK8KgIMKgIMKgIMKgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9TT0NLLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBBQ0NFU1NfTkFNRShMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9TT0NLKQo+ICAgICArwqAg
wqAgwqAgwqB9LAo+ICAgICArwqAgwqAgwqAgwqB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoExBTkRMT0NLX0FDQ0VTU19GU19NQUtFX0ZJRk8sCj4gICAgICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoEFDQ0VTU19OQU1FKExBTkRMT0NLX0FDQ0VTU19GU19NQUtFX0ZJRk8pCj4gICAgICvC
oCDCoCDCoCDCoH0sCj4gICAgICvCoCDCoCDCoCDCoHsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgTEFORExPQ0tfQUNDRVNTX0ZTX01BS0VfU1lNLAo+ICAgICArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBBQ0NFU1NfTkFNRShMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9TWU0pCj4gICAgICvC
oCDCoCDCoCDCoH0sCj4gICAgICvCoCDCoCDCoCDCoHsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgTEFORExPQ0tfQUNDRVNTX0ZTX1dSSVRFX0ZJTEUgfAo+ICAgICBMQU5ETE9DS19BQ0NF
U1NfRlNfVFJVTkNBVEUsCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFDQ0VTU19OQU1F
KExBTkRMT0NLX0FDQ0VTU19GU19UUlVOQ0FURSkKPiAgICAgK8KgIMKgIMKgIMKgfSwKPiAgICAg
K307Cj4gICAgICsKPiAgICAgK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQo+ICAgICArewo+ICAgICAr
wqAgwqAgwqAgwqBpZiAoIVNBRkVfRk9SSygpKSB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0cnVjdCB0dmFyaWFudMKgIHZhcmlhbnQgPSB0dmFyaWFudHNbdHN0X3ZhcmlhbnRdOwo+
ICAgICArCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlc3Rlcl9ydW5fYWxsX3J1bGVz
KHZhcmlhbnQuYWNjZXNzKTsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX2V4aXQoMCk7
Cj4gICAgICvCoCDCoCDCoCDCoH0KPiAgICAgK30KPiAgICAgKwo+ICAgICArc3RhdGljIHZvaWQg
c2V0dXAodm9pZCkKPiAgICAgK3sKPiAgICAgK8KgIMKgIMKgIMKgc3RydWN0IHR2YXJpYW50IHZh
cmlhbnQgPSB0dmFyaWFudHNbdHN0X3ZhcmlhbnRdOwo+ICAgICArwqAgwqAgwqAgwqBpbnQgcnVs
ZXNldF9mZDsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqB2ZXJpZnlfbGFuZGxvY2tfaXNfZW5h
YmxlZCgpOwo+ICAgICArwqAgwqAgwqAgwqB0ZXN0ZXJfY3JlYXRlX3RyZWUoKTsKPiAgICAgKwo+
ICAgICArwqAgwqAgwqAgwqB0c3RfcmVzKFRJTkZPLCAiVGVzdGluZyAlcyIsIHZhcmlhbnQuZGVz
Yyk7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgcnVsZXNldF9hdHRyLT5oYW5kbGVkX2FjY2Vz
c19mcyA9IHRlc3Rlcl9nZXRfYWxsX3J1bGVzKCk7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKg
cnVsZXNldF9mZCA9IFNBRkVfTEFORExPQ0tfQ1JFQVRFX1JVTEVTRVQoCj4gICAgICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJ1bGVzZXRfYXR0ciwgc2l6ZW9mKHN0cnVjdAo+ICAgICBsYW5kbG9j
a19ydWxlc2V0X2F0dHIpLCAwKTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqAvKiBzaW5jZSBv
dXIgYmluYXJ5IGlzIGR5bmFtaWNhbGx5IGxpbmtlZCwgd2UgbmVlZCB0bwo+ICAgICBlbmFibGUg
bGlicmFyaWVzCj4gICAgICvCoCDCoCDCoCDCoCAqIHRvIGJlIHJlYWQgYW5kIGV4ZWN1dGVkCj4g
ICAgICvCoCDCoCDCoCDCoCAqLwo+ICAgICArwqAgwqAgwqAgwqBzdHJ1Y3QgcnVsZV9hY2Nlc3Mg
cnVsZXNbXSA9IHsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeyIvbGliIiwgTEFORExP
Q0tfQUNDRVNTX0ZTX1JFQURfRklMRSB8Cj4gICAgIExBTkRMT0NLX0FDQ0VTU19GU19FWEVDVVRF
fSwKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeyIvbGliNjQiLCBMQU5ETE9DS19BQ0NF
U1NfRlNfUkVBRF9GSUxFIHwKPiAgICAgTEFORExPQ0tfQUNDRVNTX0ZTX0VYRUNVVEV9LAo+ICAg
ICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB7U0FOREJPWF9GT0xERVIsIHZhcmlhbnQuYWNjZXNz
fQo+ICAgICArwqAgwqAgwqAgwqB9Owo+Cj4KPiBHb29kIG1ldGhvZCwgYnV0IGNhbiB3ZSBmaW5k
IGEgd2F5IHRvIGdldCB0aGUgbGliLXNoYXJlZCBwYXRoIAo+IGF1dG9tYXRpY2FsbHkgYnV0IG5v
dCBoYXJkIGNvZGluZz8KPgo+IFNvbWUgcGxhdGZvcm1zIG1heSBoYXZlIGFub3RoZXIgY29uZmln
dXJhdGlvbiBvbiB0aGUgc2hhcmVkLWxpYiBwYXRoLgo+ClRoZSBvbmx5IGxpYnJhcnkgd2UgbmVl
ZCBpcyBsaWJjLnNvLCB3aGljaCBpcyB1c3VhbGx5IGluc3RhbGxlZCBpbiAvbGliIApvciAvbGli
NjQuIEkgZG9uJ3QgcmVhbGx5IGtub3cgaWYgTFRQIHN1cHBvcnRlZCBkaXN0cm9zIHdoaWNoIHBs
YWNlIGxpYmMgCnNvbWV3aGVyZSBlbHNlLgpEbyB5b3UgaGF2ZSBzdWdnZXN0aW9ucyBvbiBob3cg
dG8gZ2V0IHNoYXJlZC1saWJzIGV2ZW50dWFsbHk/IEJlY2F1c2UgCnRoZSBvbmx5IHdheSBJIGtu
b3cgaXMgdG8gY2FsbCBkbGFkZHIoKSBidXQgaXQgZG9lc24ndCBzZWVtIHRoZSB3YXkgdG8gCmdv
IChJIG9idGFpbiB0aGUgY3VycmVudCBiaW5hcnkgZmlsZSkKPgo+ICAgICArwqAgwqAgwqAgwqBp
bnQgbnVtX29mX3J1bGVzID0gQVJSQVlfU0laRShydWxlcyk7Cj4gICAgICsKPiAgICAgK8KgIMKg
IMKgIMKgZm9yIChpbnQgaSA9IDA7IGkgPCBudW1fb2ZfcnVsZXM7IGkrKykgewo+ICAgICArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoYWNjZXNzKHJ1bGVzW2ldLnBhdGgsIEZfT0spID09IC0x
KQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTsKPiAg
ICAgKwo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwYXRoX2JlbmVhdGhfYXR0ci0+YWxs
b3dlZF9hY2Nlc3MgPSBydWxlc1tpXS5hY2Nlc3M7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBhdGhfYmVuZWF0aF9hdHRyLT5wYXJlbnRfZmQgPQo+ICAgICBTQUZFX09QRU4ocnVsZXNb
aV0ucGF0aCwgT19QQVRIIHwgT19DTE9FWEVDKTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBTQUZFX0xBTkRMT0NLX0FERF9SVUxFKAo+ICAgICArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBydWxlc2V0X2ZkLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBMQU5ETE9DS19SVUxFX1BBVEhfQkVORUFUSCwKPiAgICAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGF0aF9iZW5lYXRoX2F0dHIsCj4gICAgICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDApOwo+ICAgICArCj4gICAgICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFNBRkVfQ0xPU0UocGF0aF9iZW5lYXRoX2F0dHItPnBhcmVudF9m
ZCk7Cj4gICAgICvCoCDCoCDCoCDCoH0KPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBlbmZvcmNl
X3J1bGVzZXQocnVsZXNldF9mZCk7Cj4gICAgICvCoCDCoCDCoCDCoFNBRkVfQ0xPU0UocnVsZXNl
dF9mZCk7Cj4gICAgICt9Cj4gICAgICsKPiAgICAgK3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVz
dCA9IHsKPiAgICAgK8KgIMKgIMKgIMKgLnRlc3RfYWxsID0gcnVuLAo+ICAgICArwqAgwqAgwqAg
wqAuc2V0dXAgPSBzZXR1cCwKPiAgICAgK8KgIMKgIMKgIMKgLm1pbl9rdmVyID0gIjUuMTMiLAo+
ICAgICArwqAgwqAgwqAgwqAuZm9ya3NfY2hpbGQgPSAxLAo+ICAgICArwqAgwqAgwqAgwqAubmVl
ZHNfdG1wZGlyID0gMSwKPiAgICAgK8KgIMKgIMKgIMKgLm5lZWRzX3Jvb3QgPSAxLAo+ICAgICAr
wqAgwqAgwqAgwqAudGVzdF92YXJpYW50cyA9IEFSUkFZX1NJWkUodHZhcmlhbnRzKSwKPiAgICAg
K8KgIMKgIMKgIMKgLnJlc291cmNlX2ZpbGVzID0gKGNvbnN0IGNoYXIgKltdKSB7Cj4gICAgICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRFU1RBUFAsCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoE5VTEwsCj4gICAgICvCoCDCoCDCoCDCoH0sCj4gICAgICvCoCDCoCDCoCDCoC5uZWVkc19r
Y29uZmlncyA9IChjb25zdCBjaGFyICpbXSkgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAiQ09ORklHX1NFQ1VSSVRZX0xBTkRMT0NLPXkiLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBOVUxMCj4gICAgICvCoCDCoCDCoCDCoH0sCj4gICAgICvCoCDCoCDCoCDCoC5idWZzID0g
KHN0cnVjdCB0c3RfYnVmZmVycyBbXSkgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB7
JnJ1bGVzZXRfYXR0ciwgLnNpemUgPSBzaXplb2Yoc3RydWN0Cj4gICAgIGxhbmRsb2NrX3J1bGVz
ZXRfYXR0cil9LAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB7JnBhdGhfYmVuZWF0aF9h
dHRyLCAuc2l6ZSA9IHNpemVvZihzdHJ1Y3QKPiAgICAgbGFuZGxvY2tfcGF0aF9iZW5lYXRoX2F0
dHIpfSwKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKge30sCj4gICAgICvCoCDCoCDCoCDC
oH0sCj4gICAgICvCoCDCoCDCoCDCoC5jYXBzID0gKHN0cnVjdCB0c3RfY2FwIFtdKSB7Cj4gICAg
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRTVF9DQVAoVFNUX0NBUF9SRVEsIENBUF9TWVNfQURN
SU4pLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUU1RfQ0FQKFRTVF9DQVBfUkVRLCBD
QVBfTUtOT0QpLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB7fQo+ICAgICArwqAgwqAg
wqAgwqB9LAo+ICAgICArwqAgwqAgwqAgwqAuZm9ybWF0X2RldmljZSA9IDEsCj4gICAgICvCoCDC
oCDCoCDCoC5tb3VudF9kZXZpY2UgPSAxLAo+ICAgICArwqAgwqAgwqAgwqAubW50cG9pbnQgPSBT
QU5EQk9YX0ZPTERFUiwKPiAgICAgK8KgIMKgIMKgIMKgLmFsbF9maWxlc3lzdGVtcyA9IDEsCj4g
ICAgICvCoCDCoCDCoCDCoC5za2lwX2ZpbGVzeXN0ZW1zID0gKGNvbnN0IGNoYXIgKltdKSB7Cj4g
ICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCJ2ZmF0IiwKPiAgICAgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgImV4ZmF0IiwKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTlVMTAo+ICAg
ICArwqAgwqAgwqAgwqB9LAo+ICAgICArwqAgwqAgwqAgwqAubWF4X3J1bnRpbWUgPSAzNjAwLAo+
ICAgICArfTsKPiAgICAgZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFu
ZGxvY2svbGFuZGxvY2tfZXhlYy5jCj4gICAgIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9s
YW5kbG9jay9sYW5kbG9ja19leGVjLmMKPiAgICAgbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgICAg
aW5kZXggMDAwMDAwMDAwLi5hYWU1Yzc2YjIKPiAgICAgLS0tIC9kZXYvbnVsbAo+ICAgICArKysg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xhbmRsb2NrL2xhbmRsb2NrX2V4ZWMuYwo+ICAg
ICBAQCAtMCwwICsxLDkgQEAKPiAgICAgKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyCj4gICAgICsvKgo+ICAgICArICogQ29weXJpZ2h0IChDKSAyMDI0IFNVU0Ug
TExDIEFuZHJlYSBDZXJ2ZXNhdG8KPiAgICAgPGFuZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4g
ICAgICsgKi8KPiAgICAgKwo+ICAgICAraW50IG1haW4odm9pZCkKPiAgICAgK3sKPiAgICAgK8Kg
IMKgIMKgIMKgcmV0dXJuIDA7Cj4gICAgICt9Cj4gICAgIGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2xhbmRsb2NrL2xhbmRsb2NrX3Rlc3Rlci5oCj4gICAgIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9sYW5kbG9jay9sYW5kbG9ja190ZXN0ZXIuaAo+ICAgICBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ICAgICBpbmRleCAwMDAwMDAwMDAuLjg5Y2EwODVkNwo+ICAgICAt
LS0gL2Rldi9udWxsCj4gICAgICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFuZGxv
Y2svbGFuZGxvY2tfdGVzdGVyLmgKPiAgICAgQEAgLTAsMCArMSwzNTAgQEAKPiAgICAgKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyICovCj4gICAgICsvKgo+ICAg
ICArICogQ29weXJpZ2h0IChDKSAyMDI0IFNVU0UgTExDIEFuZHJlYSBDZXJ2ZXNhdG8KPiAgICAg
PGFuZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4gICAgICsgKi8KPiAgICAgKwo+ICAgICArI2lm
bmRlZiBMQU5ETE9DS19URVNURVJfSAo+ICAgICArCj4gICAgICsjaW5jbHVkZSAidHN0X3Rlc3Qu
aCIKPiAgICAgKyNpbmNsdWRlICJsYXBpL2xhbmRsb2NrLmgiCj4gICAgICsjaW5jbHVkZSA8c3lz
L3N5c21hY3Jvcy5oPgo+ICAgICArCj4gICAgICsjZGVmaW5lIFBFUk1fTU9ERSAwNzAwCj4gICAg
ICsKPiAgICAgKyNkZWZpbmUgU0FOREJPWF9GT0xERVIgInNhbmRib3giCj4gICAgICsjZGVmaW5l
IFRFU1RBUFDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAibGFuZGxvY2tfZXhl
YyIKPiAgICAgKwo+ICAgICArI2RlZmluZSBGSUxFX0VYRUPCoCDCoCDCoCDCoCDCoCDCoCDCoCBT
QU5EQk9YX0ZPTERFUiIvIlRFU1RBUFAKPiAgICAgKyNkZWZpbmUgRklMRV9SRUFEwqAgwqAgwqAg
wqAgwqAgwqAgwqAgU0FOREJPWF9GT0xERVIiL2ZpbGVfcmVhZCIKPiAgICAgKyNkZWZpbmUgRklM
RV9XUklURcKgIMKgIMKgIMKgIMKgIMKgIMKgU0FOREJPWF9GT0xERVIiL2ZpbGVfd3JpdGUiCj4g
ICAgICsjZGVmaW5lIEZJTEVfUkVNT1ZFwqAgwqAgwqAgwqAgwqAgwqAgU0FOREJPWF9GT0xERVIi
L2ZpbGVfcmVtb3ZlIgo+ICAgICArI2RlZmluZSBGSUxFX1VOTElOS8KgIMKgIMKgIMKgIMKgIMKg
IFNBTkRCT1hfRk9MREVSIi9maWxlX3VubGluayIKPiAgICAgKyNkZWZpbmUgRklMRV9VTkxJTktB
VMKgIFNBTkRCT1hfRk9MREVSIi9maWxlX3VubGlua2F0Igo+ICAgICArI2RlZmluZSBGSUxFX1RS
VU5DQVRFwqAgU0FOREJPWF9GT0xERVIiL2ZpbGVfdHJ1bmNhdGUiCj4gICAgICsjZGVmaW5lIEZJ
TEVfUkVHVUxBUsKgIMKgU0FOREJPWF9GT0xERVIiL3JlZ3VsYXIwIgo+ICAgICArI2RlZmluZSBG
SUxFX1NPQ0tFVMKgIMKgIMKgIMKgIMKgIMKgIFNBTkRCT1hfRk9MREVSIi9zb2NrZXQwIgo+ICAg
ICArI2RlZmluZSBGSUxFX0ZJRk/CoCDCoCDCoCDCoCDCoCDCoCDCoCBTQU5EQk9YX0ZPTERFUiIv
ZmlmbzAiCj4gICAgICsjZGVmaW5lIEZJTEVfU1lNMMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNBTkRC
T1hfRk9MREVSIi9zeW1ib2xpYzAiCj4gICAgICsjZGVmaW5lIEZJTEVfU1lNMcKgIMKgIMKgIMKg
IMKgIMKgIMKgIFNBTkRCT1hfRk9MREVSIi9zeW1ib2xpYzEiCj4gICAgICsjZGVmaW5lIERJUl9S
RUFERElSwqAgwqAgwqAgwqAgwqAgwqAgU0FOREJPWF9GT0xERVIiL2Rpcl9yZWFkZGlyIgo+ICAg
ICArI2RlZmluZSBESVJfUk1ESVLCoCDCoCDCoCDCoCDCoCDCoCDCoCBTQU5EQk9YX0ZPTERFUiIv
ZGlyX3JtZGlyIgo+ICAgICArI2RlZmluZSBERVZfQ0hBUjDCoCDCoCDCoCDCoCDCoCDCoCDCoCBT
QU5EQk9YX0ZPTERFUiIvY2hhcmRldjAiCj4gICAgICsjZGVmaW5lIERFVl9CTEswwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBTQU5EQk9YX0ZPTERFUiIvYmxrZGV2MCIKPiAgICAgKwo+ICAgICArI2Rl
ZmluZSBBTExfUlVMRVMgKFwKPiAgICAgK8KgIMKgIMKgIMKgTEFORExPQ0tfQUNDRVNTX0ZTX0VY
RUNVVEUgfCBcCj4gICAgICvCoCDCoCDCoCDCoExBTkRMT0NLX0FDQ0VTU19GU19XUklURV9GSUxF
IHwgXAo+ICAgICArwqAgwqAgwqAgwqBMQU5ETE9DS19BQ0NFU1NfRlNfUkVBRF9GSUxFIHwgXAo+
ICAgICArwqAgwqAgwqAgwqBMQU5ETE9DS19BQ0NFU1NfRlNfUkVBRF9ESVIgfCBcCj4gICAgICvC
oCDCoCDCoCDCoExBTkRMT0NLX0FDQ0VTU19GU19SRU1PVkVfRElSIHwgXAo+ICAgICArwqAgwqAg
wqAgwqBMQU5ETE9DS19BQ0NFU1NfRlNfUkVNT1ZFX0ZJTEUgfCBcCj4gICAgICvCoCDCoCDCoCDC
oExBTkRMT0NLX0FDQ0VTU19GU19NQUtFX0NIQVIgfCBcCj4gICAgICvCoCDCoCDCoCDCoExBTkRM
T0NLX0FDQ0VTU19GU19NQUtFX0RJUiB8IFwKPiAgICAgK8KgIMKgIMKgIMKgTEFORExPQ0tfQUND
RVNTX0ZTX01BS0VfUkVHIHwgXAo+ICAgICArwqAgwqAgwqAgwqBMQU5ETE9DS19BQ0NFU1NfRlNf
TUFLRV9TT0NLIHwgXAo+ICAgICArwqAgwqAgwqAgwqBMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9G
SUZPIHwgXAo+ICAgICArwqAgwqAgwqAgwqBMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9CTE9DSyB8
IFwKPiAgICAgK8KgIMKgIMKgIMKgTEFORExPQ0tfQUNDRVNTX0ZTX01BS0VfU1lNIHwgXAo+ICAg
ICArwqAgwqAgwqAgwqBMQU5ETE9DS19BQ0NFU1NfRlNfUkVGRVIgfCBcCj4gICAgICvCoCDCoCDC
oCDCoExBTkRMT0NLX0FDQ0VTU19GU19UUlVOQ0FURSB8IFwKPiAgICAgK8KgIMKgIMKgIMKgTEFO
RExPQ0tfQUNDRVNTX05FVF9CSU5EX1RDUCB8IFwKPiAgICAgK8KgIMKgIMKgIMKgTEFORExPQ0tf
QUNDRVNTX05FVF9DT05ORUNUX1RDUCB8IFwKPiAgICAgK8KgIMKgIMKgIMKgTEFORExPQ0tfQUND
RVNTX0ZTX0lPQ1RMX0RFVikKPiAgICAgKwo+ICAgICArc3RhdGljIGNoYXIgKnJlYWRkaXJfZmls
ZXNbXSA9IHsKPiAgICAgK8KgIMKgIMKgIMKgRElSX1JFQURESVIiL2ZpbGUwIiwKPiAgICAgK8Kg
IMKgIMKgIMKgRElSX1JFQURESVIiL2ZpbGUxIiwKPiAgICAgK8KgIMKgIMKgIMKgRElSX1JFQURE
SVIiL2ZpbGUyIiwKPiAgICAgK307Cj4gICAgICsKPiAgICAgK3N0YXRpYyBpbnQgZGV2X2NocjsK
PiAgICAgK3N0YXRpYyBpbnQgZGV2X2JsazsKPiAgICAgKwo+ICAgICArc3RhdGljIGludCB0ZXN0
ZXJfZ2V0X2FsbF9ydWxlcyh2b2lkKQo+ICAgICArewo+ICAgICArwqAgwqAgwqAgwqBpbnQgYWJp
Owo+ICAgICArwqAgwqAgwqAgwqBpbnQgYWxsX3J1bGVzID0gQUxMX1JVTEVTOwo+ICAgICArCj4g
ICAgICvCoCDCoCDCoCDCoGFiaSA9IFNBRkVfTEFORExPQ0tfQ1JFQVRFX1JVTEVTRVQoCj4gICAg
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5VTEwsIDAsIExBTkRMT0NLX0NSRUFURV9SVUxFU0VU
X1ZFUlNJT04pOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoGlmIChhYmkgPCAyKQo+ICAgICAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhbGxfcnVsZXMgJj0gfkxBTkRMT0NLX0FDQ0VTU19GU19S
RUZFUjsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAoYWJpIDwgMykKPiAgICAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYWxsX3J1bGVzICY9IH5MQU5ETE9DS19BQ0NFU1NfRlNfVFJVTkNB
VEU7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgaWYgKGFiaSA8IDQpIHsKPiAgICAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYWxsX3J1bGVzICY9IH4oTEFORExPQ0tfQUNDRVNTX05FVF9CSU5E
X1RDUCB8Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoExBTkRMT0NL
X0FDQ0VTU19ORVRfQ09OTkVDVF9UQ1ApOwo+ICAgICArwqAgwqAgwqAgwqB9Cj4gICAgICsKPiAg
ICAgK8KgIMKgIMKgIMKgaWYgKGFiaSA8IDUpCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGFsbF9ydWxlcyAmPSB+TEFORExPQ0tfQUNDRVNTX0ZTX0lPQ1RMX0RFVjsKPiAgICAgKwo+ICAg
ICArwqAgwqAgwqAgwqByZXR1cm4gYWxsX3J1bGVzOwo+ICAgICArfQo+ICAgICArCj4gICAgICtz
dGF0aWMgdm9pZCB0ZXN0ZXJfY3JlYXRlX3RyZWUodm9pZCkKPiAgICAgK3sKPiAgICAgK8KgIMKg
IMKgIMKgaWYgKGFjY2VzcyhTQU5EQk9YX0ZPTERFUiwgRl9PSykgPT0gLTEpCj4gICAgICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFNBRkVfTUtESVIoU0FOREJPWF9GT0xERVIsIFBFUk1fTU9ERSk7
Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgLyogZm9sZGVycyAqLwo+ICAgICArwqAgwqAgwqAg
wqBTQUZFX01LRElSKERJUl9STURJUiwgUEVSTV9NT0RFKTsKPiAgICAgK8KgIMKgIMKgIMKgU0FG
RV9NS0RJUihESVJfUkVBRERJUiwgUEVSTV9NT0RFKTsKPiAgICAgK8KgIMKgIMKgIMKgZm9yIChz
aXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHJlYWRkaXJfZmlsZXMpOyBpKyspCj4gICAgICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNBRkVfVE9VQ0gocmVhZGRpcl9maWxlc1tpXSwgUEVSTV9N
T0RFLCBOVUxMKTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqAvKiBmaWxlcyAqLwo+ICAgICAr
wqAgwqAgwqAgwqB0c3RfZmlsbF9maWxlKEZJTEVfUkVBRCwgJ2EnLCBnZXRwYWdlc2l6ZSgpLCAx
KTsKPiAgICAgK8KgIMKgIMKgIMKgU0FGRV9UT1VDSChGSUxFX1dSSVRFLCBQRVJNX01PREUsIE5V
TEwpOwo+ICAgICArwqAgwqAgwqAgwqBTQUZFX1RPVUNIKEZJTEVfUkVNT1ZFLCBQRVJNX01PREUs
IE5VTEwpOwo+ICAgICArwqAgwqAgwqAgwqBTQUZFX1RPVUNIKEZJTEVfVU5MSU5LLCBQRVJNX01P
REUsIE5VTEwpOwo+ICAgICArwqAgwqAgwqAgwqBTQUZFX1RPVUNIKEZJTEVfVU5MSU5LQVQsIFBF
Uk1fTU9ERSwgTlVMTCk7Cj4gICAgICvCoCDCoCDCoCDCoFNBRkVfVE9VQ0goRklMRV9UUlVOQ0FU
RSwgUEVSTV9NT0RFLCBOVUxMKTsKPiAgICAgK8KgIMKgIMKgIMKgU0FGRV9UT1VDSChGSUxFX1NZ
TTAsIFBFUk1fTU9ERSwgTlVMTCk7Cj4gICAgICvCoCDCoCDCoCDCoFNBRkVfQ1AoVEVTVEFQUCwg
RklMRV9FWEVDKTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqAvKiBkZXZpY2VzICovCj4gICAg
ICvCoCDCoCDCoCDCoGRldl9jaHIgPSBtYWtlZGV2KDEsIDMpOwo+ICAgICArwqAgwqAgwqAgwqBk
ZXZfYmxrID0gbWFrZWRldig3LCAwKTsKPiAgICAgK30KPiAgICAgKwo+ICAgICArc3RhdGljIHZv
aWQgX3Rlc3RfZXhlYyhjb25zdCBpbnQgcmVzdWx0KQo+ICAgICArewo+ICAgICArwqAgwqAgwqAg
wqBpbnQgc3RhdHVzOwo+ICAgICArwqAgwqAgwqAgwqBwaWRfdCBwaWQ7Cj4gICAgICvCoCDCoCDC
oCDCoGNoYXIgKmNvbnN0IGFyZ3NbXSA9IHsoY2hhciAqKUZJTEVfRVhFQywgTlVMTH07Cj4gICAg
ICsKPiAgICAgK8KgIMKgIMKgIMKgdHN0X3JlcyhUSU5GTywgIlRlc3QgYmluYXJ5IGV4ZWN1dGlv
biIpOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoHBpZCA9IFNBRkVfRk9SSygpOwo+ICAgICAr
wqAgwqAgwqAgwqBpZiAoIXBpZCkgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnQg
cnZhbDsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmVzdWx0ID09
IFRQQVNTKSB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJ2YWwg
PSBleGVjdmUoRklMRV9FWEVDLCBhcmdzLCBOVUxMKTsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJ2YWwgPT0gLTEpCj4gICAgICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9yZXMoVEZBSUwgfCBURVJSTk8sICJG
YWlsZWQgdG8KPiAgICAgZXhlY3V0ZSB0ZXN0IGJpbmFyeSIpOwo+ICAgICArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9IGVsc2Ugewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBUU1RfRVhQX0ZBSUwoZXhlY3ZlKEZJTEVfRVhFQywgYXJncywKPiAgICAgTlVMTCksIEVB
Q0NFUyk7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0KPiAgICAgKwo+ICAgICArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBfZXhpdCgxKTsKPiAgICAgK8KgIMKgIMKgIMKgfQo+ICAgICAr
Cj4gICAgICvCoCDCoCDCoCDCoFNBRkVfV0FJVFBJRChwaWQsICZzdGF0dXMsIDApOwo+ICAgICAr
wqAgwqAgwqAgwqBpZiAoIVdJRkVYSVRFRChzdGF0dXMpIHx8IFdFWElUU1RBVFVTKHN0YXR1cykg
IT0gMCkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuOwo+ICAgICArCj4gICAg
ICvCoCDCoCDCoCDCoHRzdF9yZXMocmVzdWx0LCAiVGVzdCBiaW5hcnkgaGFzIGJlZW4gZXhlY3V0
ZWQiKTsKPiAgICAgK30KPiAgICAgKwo+ICAgICArc3RhdGljIHZvaWQgX3Rlc3Rfd3JpdGUoY29u
c3QgaW50IHJlc3VsdCkKPiAgICAgK3sKPiAgICAgK8KgIMKgIMKgIMKgdHN0X3JlcyhUSU5GTywg
IlRlc3Qgd3JpdGluZyBmaWxlIik7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgaWYgKHJlc3Vs
dCA9PSBUUEFTUykKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFNUX0VYUF9GRChvcGVu
KEZJTEVfV1JJVEUsIE9fV1JPTkxZLCBQRVJNX01PREUpKTsKPiAgICAgK8KgIMKgIMKgIMKgZWxz
ZQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUU1RfRVhQX0ZBSUwob3BlbihGSUxFX1dS
SVRFLCBPX1dST05MWSwKPiAgICAgUEVSTV9NT0RFKSwgRUFDQ0VTKTsKPiAgICAgKwo+ICAgICAr
wqAgwqAgwqAgwqBpZiAoVFNUX1JFVCAhPSAtMSkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgU0FGRV9DTE9TRShUU1RfUkVUKTsKPiAgICAgK30KPiAgICAgKwo+ICAgICArc3RhdGljIHZv
aWQgX3Rlc3RfcmVhZChjb25zdCBpbnQgcmVzdWx0KQo+ICAgICArewo+ICAgICArwqAgwqAgwqAg
wqB0c3RfcmVzKFRJTkZPLCAiVGVzdCByZWFkaW5nIGZpbGUiKTsKPiAgICAgKwo+ICAgICArwqAg
wqAgwqAgwqBpZiAocmVzdWx0ID09IFRQQVNTKQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBUU1RfRVhQX0ZEKG9wZW4oRklMRV9SRUFELCBPX1JET05MWSwgUEVSTV9NT0RFKSk7Cj4gICAg
ICvCoCDCoCDCoCDCoGVsc2UKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFNUX0VYUF9G
QUlMKG9wZW4oRklMRV9SRUFELCBPX1JET05MWSwgUEVSTV9NT0RFKSwKPiAgICAgRUFDQ0VTKTsK
PiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAoVFNUX1JFVCAhPSAtMSkKPiAgICAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgU0FGRV9DTE9TRShUU1RfUkVUKTsKPiAgICAgK30KPiAgICAgKwo+
ICAgICArc3RhdGljIHZvaWQgX3Rlc3RfcmVhZGRpcihjb25zdCBpbnQgcmVzdWx0KQo+ICAgICAr
ewo+ICAgICArwqAgwqAgwqAgwqB0c3RfcmVzKFRJTkZPLCAiVGVzdCByZWFkaW5nIGRpcmVjdG9y
eSIpOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoERJUiAqZGlyOwo+ICAgICArwqAgwqAgwqAg
wqBzdHJ1Y3QgZGlyZW50ICpkZTsKPiAgICAgK8KgIMKgIMKgIMKgaW50IGZpbGVzX2NvdW50ZWQg
PSAwOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoGRpciA9IG9wZW5kaXIoRElSX1JFQURESVIp
Owo+ICAgICArwqAgwqAgwqAgwqBpZiAoIWRpcikgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB0c3RfcmVzKHJlc3VsdCA9PSBUUEFTUyA/IFRGQUlMIDogVFBBU1MsCj4gICAgICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCJDYW4ndCByZWFkICclcycgZGlyZWN0b3J5
IiwgRElSX1JFQURESVIpOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybjsKPiAgICAgK8KgIMKgIMKgIMKgfQo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoHRzdF9y
ZXMocmVzdWx0LCAiQ2FuIHJlYWQgJyVzJyBkaXJlY3RvcnkiLCBESVJfUkVBRERJUik7Cj4gICAg
ICvCoCDCoCDCoCDCoGlmIChyZXN1bHQgPT0gVEZBSUwpCj4gICAgICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJldHVybjsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqB3aGlsZSAoKGRlID0gcmVh
ZGRpcihkaXIpKSAhPSBOVUxMKSB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChk
ZS0+ZF90eXBlICE9IERUX1JFRykKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29udGludWU7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZm9y
IChzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHJlYWRkaXJfZmlsZXMpOwo+ICAgICBpKysp
IHsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJlYWRkaXJf
ZmlsZXNbaV0gPT0gTlVMTCkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY29udGludWU7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHN0cnN0cihyZWFkZGlyX2ZpbGVzW2ldLCBkZS0+ZF9uYW1l
KQo+ICAgICAhPSBOVUxMKQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBmaWxlc19jb3VudGVkKys7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH0KPiAgICAgK8KgIMKgIMKgIMKgfQo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoFNBRkVf
Q0xPU0VESVIoZGlyKTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBUU1RfRVhQX0VRX0xJKGZp
bGVzX2NvdW50ZWQsIEFSUkFZX1NJWkUocmVhZGRpcl9maWxlcykpOwo+ICAgICArfQo+ICAgICAr
Cj4gICAgICtzdGF0aWMgdm9pZCBfdGVzdF9ybWRpcihjb25zdCBpbnQgcmVzdWx0KQo+ICAgICAr
ewo+ICAgICArwqAgwqAgwqAgwqB0c3RfcmVzKFRJTkZPLCAiVGVzdCByZW1vdmluZyBkaXJlY3Rv
cnkiKTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAocmVzdWx0ID09IFRQQVNTKQo+ICAg
ICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUU1RfRVhQX1BBU1Mocm1kaXIoRElSX1JNRElSKSk7
Cj4gICAgICvCoCDCoCDCoCDCoGVsc2UKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFNU
X0VYUF9GQUlMKHJtZGlyKERJUl9STURJUiksIEVBQ0NFUyk7Cj4gICAgICt9Cj4gICAgICsKPiAg
ICAgK3N0YXRpYyB2b2lkIF90ZXN0X3JtZmlsZShjb25zdCBpbnQgcmVzdWx0KQo+ICAgICArewo+
ICAgICArwqAgwqAgwqAgwqB0c3RfcmVzKFRJTkZPLCAiVGVzdCByZW1vdmluZyBmaWxlIik7Cj4g
ICAgICsKPiAgICAgK8KgIMKgIMKgIMKgaWYgKHJlc3VsdCA9PSBUUEFTUykgewo+ICAgICArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBUU1RfRVhQX1BBU1ModW5saW5rKEZJTEVfVU5MSU5LKSk7Cj4g
ICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRTVF9FWFBfUEFTUyhyZW1vdmUoRklMRV9SRU1P
VkUpKTsKPiAgICAgK8KgIMKgIMKgIMKgfSBlbHNlIHsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgVFNUX0VYUF9GQUlMKHVubGluayhGSUxFX1VOTElOSyksIEVBQ0NFUyk7Cj4gICAgICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRTVF9FWFBfRkFJTChyZW1vdmUoRklMRV9SRU1PVkUpLCBF
QUNDRVMpOwo+ICAgICArwqAgwqAgwqAgwqB9Cj4gICAgICt9Cj4gICAgICsKPiAgICAgK3N0YXRp
YyB2b2lkIF90ZXN0X21ha2UoCj4gICAgICvCoCDCoCDCoCDCoGNvbnN0IGNoYXIgKnBhdGgsCj4g
ICAgICvCoCDCoCDCoCDCoGNvbnN0IGludCB0eXBlLAo+ICAgICArwqAgwqAgwqAgwqBjb25zdCBp
bnQgZGV2LAo+ICAgICArwqAgwqAgwqAgwqBjb25zdCBpbnQgcmVzdWx0KQo+ICAgICArewo+ICAg
ICArwqAgwqAgwqAgwqB0c3RfcmVzKFRJTkZPLCAiVGVzdCBub3JtYWwgb3Igc3BlY2lhbCBmaWxl
cyBjcmVhdGlvbiIpOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoGlmIChyZXN1bHQgPT0gVFBB
U1MpCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRTVF9FWFBfUEFTUyhta25vZChwYXRo
LCB0eXBlIHwgMDQwMCwgZGV2KSk7Cj4gICAgICvCoCDCoCDCoCDCoGVsc2UKPiAgICAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgVFNUX0VYUF9GQUlMKG1rbm9kKHBhdGgsIHR5cGUgfCAwNDAwLCBk
ZXYpLCBFQUNDRVMpOwo+ICAgICArfQo+ICAgICArCj4gICAgICtzdGF0aWMgdm9pZCBfdGVzdF9z
eW1ib2xpYyhjb25zdCBpbnQgcmVzdWx0KQo+ICAgICArewo+ICAgICArwqAgwqAgwqAgwqB0c3Rf
cmVzKFRJTkZPLCAiVGVzdCBzeW1ib2xpYyBsaW5rcyIpOwo+ICAgICArCj4gICAgICvCoCDCoCDC
oCDCoGlmIChyZXN1bHQgPT0gVFBBU1MpCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRT
VF9FWFBfUEFTUyhzeW1saW5rKEZJTEVfU1lNMCwgRklMRV9TWU0xKSk7Cj4gICAgICvCoCDCoCDC
oCDCoGVsc2UKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFNUX0VYUF9GQUlMKHN5bWxp
bmsoRklMRV9TWU0wLCBGSUxFX1NZTTEpLCBFQUNDRVMpOwo+ICAgICArfQo+ICAgICArCj4gICAg
ICtzdGF0aWMgdm9pZCBfdGVzdF90cnVuY2F0ZShjb25zdCBpbnQgcmVzdWx0KQo+ICAgICArewo+
ICAgICArwqAgwqAgwqAgwqBpbnQgZmQ7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgdHN0X3Jl
cyhUSU5GTywgIlRlc3QgdHJ1bmNhdGluZyBmaWxlIik7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKg
IMKgaWYgKHJlc3VsdCA9PSBUUEFTUykgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBU
U1RfRVhQX1BBU1ModHJ1bmNhdGUoRklMRV9UUlVOQ0FURSwgMTApKTsKPiAgICAgKwo+ICAgICAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmZCA9IFRTVF9FWFBfRkQob3BlbihGSUxFX1RSVU5DQVRF
LCBPX1dST05MWSwKPiAgICAgUEVSTV9NT0RFKSk7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmIChmZCAhPSAtMSkgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBUU1RfRVhQX1BBU1MoZnRydW5jYXRlKGZkLCAxMCkpOwo+ICAgICArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTQUZFX0NMT1NFKGZkKTsKPiAgICAgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfQo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZkID0g
VFNUX0VYUF9GRChvcGVuKEZJTEVfVFJVTkNBVEUsIE9fV1JPTkxZIHwKPiAgICAgT19UUlVOQywg
UEVSTV9NT0RFKSk7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChmZCAhPSAtMSkK
PiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU0FGRV9DTE9TRShmZCk7
Cj4gICAgICvCoCDCoCDCoCDCoH0gZWxzZSB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oFRTVF9FWFBfRkFJTCh0cnVuY2F0ZShGSUxFX1RSVU5DQVRFLCAxMCksIEVBQ0NFUyk7Cj4gICAg
ICsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmQgPSBvcGVuKEZJTEVfVFJVTkNBVEUs
IE9fV1JPTkxZLCBQRVJNX01PREUpOwo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
ZmQgIT0gLTEpIHsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFNU
X0VYUF9GQUlMKGZ0cnVuY2F0ZShmZCwgMTApLCBFQUNDRVMpOwo+ICAgICArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTQUZFX0NMT1NFKGZkKTsKPiAgICAgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfQo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRTVF9F
WFBfRkFJTChvcGVuKEZJTEVfVFJVTkNBVEUsIE9fV1JPTkxZIHwKPiAgICAgT19UUlVOQywgUEVS
TV9NT0RFKSwKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRUFDQ0VT
KTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoVFNUX1JFVCAhPSAt
MSkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU0FGRV9DTE9TRShU
U1RfUkVUKTsKPiAgICAgK8KgIMKgIMKgIMKgfQo+ICAgICArfQo+ICAgICArCj4gICAgICtzdGF0
aWMgdm9pZCB0ZXN0ZXJfcnVuX3J1bGVzKGNvbnN0IGludCBydWxlcywgY29uc3QgaW50IHJlc3Vs
dCkKPiAgICAgK3sKPiAgICAgK8KgIMKgIMKgIMKgaWYgKHJ1bGVzICYgTEFORExPQ0tfQUNDRVNT
X0ZTX0VYRUNVVEUpCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF90ZXN0X2V4ZWMocmVz
dWx0KTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAocnVsZXMgJiBMQU5ETE9DS19BQ0NF
U1NfRlNfV1JJVEVfRklMRSkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX3Rlc3Rfd3Jp
dGUocmVzdWx0KTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAocnVsZXMgJiBMQU5ETE9D
S19BQ0NFU1NfRlNfUkVBRF9GSUxFKQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfdGVz
dF9yZWFkKHJlc3VsdCk7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgaWYgKHJ1bGVzICYgTEFO
RExPQ0tfQUNDRVNTX0ZTX1JFQURfRElSKQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBf
dGVzdF9yZWFkZGlyKHJlc3VsdCk7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgaWYgKHJ1bGVz
ICYgTEFORExPQ0tfQUNDRVNTX0ZTX1JFTU9WRV9ESVIpCj4gICAgICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoF90ZXN0X3JtZGlyKHJlc3VsdCk7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgaWYg
KHJ1bGVzICYgTEFORExPQ0tfQUNDRVNTX0ZTX1JFTU9WRV9GSUxFKQo+ICAgICArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBfdGVzdF9ybWZpbGUocmVzdWx0KTsKPiAgICAgKwo+ICAgICArwqAgwqAg
wqAgwqBpZiAocnVsZXMgJiBMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9DSEFSKQo+ICAgICArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBfdGVzdF9tYWtlKERFVl9DSEFSMCwgU19JRkNIUiwgZGV2X2No
ciwgcmVzdWx0KTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAocnVsZXMgJiBMQU5ETE9D
S19BQ0NFU1NfRlNfTUFLRV9CTE9DSykKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX3Rl
c3RfbWFrZShERVZfQkxLMCwgU19JRkJMSywgZGV2X2JsaywgcmVzdWx0KTsKPiAgICAgKwo+ICAg
ICArwqAgwqAgwqAgwqBpZiAocnVsZXMgJiBMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9SRUcpCj4g
ICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF90ZXN0X21ha2UoRklMRV9SRUdVTEFSLCBTX0lG
UkVHLCAwLCByZXN1bHQpOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoGlmIChydWxlcyAmIExB
TkRMT0NLX0FDQ0VTU19GU19NQUtFX1NPQ0spCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oF90ZXN0X21ha2UoRklMRV9TT0NLRVQsIFNfSUZTT0NLLCAwLCByZXN1bHQpOwo+ICAgICArCj4g
ICAgICvCoCDCoCDCoCDCoGlmIChydWxlcyAmIExBTkRMT0NLX0FDQ0VTU19GU19NQUtFX0ZJRk8p
Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF90ZXN0X21ha2UoRklMRV9GSUZPLCBTX0lG
SUZPLCAwLCByZXN1bHQpOwo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoGlmIChydWxlcyAmIExB
TkRMT0NLX0FDQ0VTU19GU19NQUtFX1NZTSkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
X3Rlc3Rfc3ltYm9saWMocmVzdWx0KTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAocnVs
ZXMgJiBMQU5ETE9DS19BQ0NFU1NfRlNfVFJVTkNBVEUpIHsKPiAgICAgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKCh0c3Rfa3ZlcmNtcCg2LCAyLCAwKSkgPCAwKSB7Cj4gICAgICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9yZXMoVElORk8sICJTa2lwIHRydW5jYXRl
IHRlc3QuCj4gICAgIE1pbmltdW0ga2VybmVsIHZlcnNpb24gaXMgNi4yIik7Cj4gICAgICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjsKPiAgICAgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfQo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF90ZXN0
X3RydW5jYXRlKHJlc3VsdCk7Cj4gICAgICvCoCDCoCDCoCDCoH0KPiAgICAgK30KPiAgICAgKwo+
ICAgICArc3RhdGljIGlubGluZSB2b2lkIHRlc3Rlcl9ydW5fYWxsX3J1bGVzKGNvbnN0IGludCBw
YXNzX3J1bGVzKQo+ICAgICArewo+ICAgICArwqAgwqAgwqAgwqBpbnQgZmFpbF9ydWxlczsKPiAg
ICAgK8KgIMKgIMKgIMKgaW50IGFsbF9ydWxlczsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBh
bGxfcnVsZXMgPSB0ZXN0ZXJfZ2V0X2FsbF9ydWxlcygpOwo+ICAgICArwqAgwqAgwqAgwqBmYWls
X3J1bGVzID0gYWxsX3J1bGVzICYgfnBhc3NfcnVsZXM7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKg
IMKgdGVzdGVyX3J1bl9ydWxlcyhwYXNzX3J1bGVzLCBUUEFTUyk7Cj4gICAgICvCoCDCoCDCoCDC
oHRlc3Rlcl9ydW5fcnVsZXMoZmFpbF9ydWxlcywgVEZBSUwpOwo+ICAgICArfQo+ICAgICArCj4g
ICAgICsjZW5kaWYKPgo+ICAgICAtLSAKPiAgICAgMi40My4wCj4KPgo+ICAgICAtLSAKPiAgICAg
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4K
Pgo+Cj4gLS0gCj4gUmVnYXJkcywKPiBMaSBXYW5nCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
