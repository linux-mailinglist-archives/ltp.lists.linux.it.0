Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2908483ADEA
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jan 2024 17:03:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFD1F3CFB39
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jan 2024 17:03:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5436A3CCC5B
 for <ltp@lists.linux.it>; Wed, 24 Jan 2024 17:03:44 +0100 (CET)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E2013613F0D
 for <ltp@lists.linux.it>; Wed, 24 Jan 2024 17:03:43 +0100 (CET)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7831806c527so494944685a.3
 for <ltp@lists.linux.it>; Wed, 24 Jan 2024 08:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706112222; x=1706717022; darn=lists.linux.it;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHN9HaRjw37yK1IEetUFVIEhTvGoYDuESP5sOP2HJ1Q=;
 b=J3Dsn0UDU1yGzdM+p5/6plAPWdHjDa18jAZUsOUbPSwV+Q3zIdIEcVva8mfOPs10SQ
 4pcPl/mz+bPTGP0QLWXq3R0D4Nq3Pz0eohJpKYt2w0P9yxAX/BBZShMwyLPrR+VD5fOx
 8jeGPL+hacsmHKUxqEvCZ50K/P5ZLHks18NdWu92LFEAvycEKMgqwcS/MrG1B6BzxnB1
 sXiSDa4KACXIBZmFmbrHHoqC9WwS00C/ZOlqC+weHr83xFk2f+uMHFgtni/DFLk8gaRt
 E7ip282koKNZMsa6G84zkySxp44Q0e+KgeuTKDquDkfMKT0otQ+hNspcQfQchRqx4QgP
 U+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706112222; x=1706717022;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHN9HaRjw37yK1IEetUFVIEhTvGoYDuESP5sOP2HJ1Q=;
 b=Qdy+4/HcFkhVv9cwFowL2nBVV2Y58A6mi0ENISx3iCd3dPQeFttc4nSvdc+N3PPW1E
 r4o7uMty69E+zvpJUnSRyzPauiJ2MoYIEeYL5dXapnG5BF7YspiBJE68n/lwlwax5wFZ
 U1vNwG9qcwl5d1SAhrCePlNybbBEIsrtKaP5QdDdXvH3/QxVxs2EJ47AKZnnMIyd3p6h
 gNvVTKkpO0kbQFQ+xYe5t/+fdFq4IX+F8KMv0J7fMDlTOQjs/ZrByLnn+wBjQ532fQlI
 /xWHPkEFn8msFVDM8Nm6b9Z4lpiIgrpqA5e+Zsru8y0yajSfDNKDDA1ic8s04I+RTjCP
 IDHA==
X-Gm-Message-State: AOJu0Ywwc6ZzChhGsKoqyyjk8cVLf3jC+GodvUmjak0VvR2OKhyWOtYS
 qRDU0PbCalC+Z+/902lzs7nYXb/YV20LFGG48jrcoCr45uDHBS0DZgEbgS0RcUTRsWcci3x3F0M
 BwJ/fPVw8JwPwP+EtDdH1VnWNbCA55tJO
X-Google-Smtp-Source: AGHT+IEFSIjBYQy5DNtge3ia3vzTV349EqnFDYWOstCj89t05RNlR2uCA3AA7q4ihRIhUJMsTFGTZsR9gYhzQ/8aYig=
X-Received: by 2002:a05:6214:2484:b0:681:9ad3:1615 with SMTP id
 gi4-20020a056214248400b006819ad31615mr3245281qvb.43.1706112222523; Wed, 24
 Jan 2024 08:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20240124122130.288374-1-pvorel@suse.cz>
 <20240124160153.mwjuhy5l5xju2xwv@quack3>
In-Reply-To: <20240124160153.mwjuhy5l5xju2xwv@quack3>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 24 Jan 2024 18:03:29 +0200
Message-ID: <CAOQ4uxh1VwoMK_ssjdcxo_sk4cw0pD_FcXZ6Lb2=XHLf21kGAw@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled
 version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] fanotify: Handle EOPNOTSUPP as TCONF
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
Cc: Dominique Leuenberger <dleuenberger@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgNjowMeKAr1BNIEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+
IHdyb3RlOgo+Cj4gT24gV2VkIDI0LTAxLTI0IDEzOjIxOjMwLCBQZXRyIFZvcmVsIHdyb3RlOgo+
ID4gRm91bmQgb24ga2VybmVsIDYuNyAoVHVtYmxld2VlZCkgb24gZXhmYXQ6Cj4gPgo+ID4gdHN0
X3Rlc3QuYzoxNjY5OiBUSU5GTzogPT09IFRlc3Rpbmcgb24gZXhmYXQgPT09Cj4gPiB0c3RfdGVz
dC5jOjExMTc6IFRJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9vcDEgd2l0aCBleGZhdCBvcHRzPScn
IGV4dHJhIG9wdHM9JycKPiA+IHRzdF90ZXN0LmM6MTEzMTogVElORk86IE1vdW50aW5nIC9kZXYv
bG9vcDEgdG8gL3RtcC9MVFBfZmFub0w5S0xFL21udHBvaW50IGZzdHlwPWV4ZmF0IGZsYWdzPTAK
PiA+IGZhbm90aWZ5MTQuYzoyNDY6IFRJTkZPOiBUZXN0IGNhc2UgMDogZmFub3RpZnlfaW5pdChG
QU5fQ0xBU1NfQ09OVEVOVCB8IEZBTl9SRVBPUlRfRklELCBPX1JET05MWSkKPiA+IGZhbm90aWZ5
MTQuYzoyNjA6IFRQQVNTOiBmYW5vdGlmeV9pbml0KHRjLT5pbml0LmZsYWdzLCBPX1JET05MWSkg
OiBFSU5WQUwgKDIyKQo+ID4gZmFub3RpZnkxNC5jOjI0NjogVElORk86IFRlc3QgY2FzZSAxOiBm
YW5vdGlmeV9pbml0KEZBTl9DTEFTU19QUkVfQ09OVEVOVCB8IEZBTl9SRVBPUlRfRklELCBPX1JE
T05MWSkKPiA+IGZhbm90aWZ5MTQuYzoyNjA6IFRQQVNTOiBmYW5vdGlmeV9pbml0KHRjLT5pbml0
LmZsYWdzLCBPX1JET05MWSkgOiBFSU5WQUwgKDIyKQo+ID4gZmFub3RpZnkxNC5jOjI0NjogVElO
Rk86IFRlc3QgY2FzZSAyOiBmYW5vdGlmeV9pbml0KEZBTl9DTEFTU19OT1RJRiwgT19SRE9OTFkp
Cj4gPiBmYW5vdGlmeTE0LmM6MjYzOiBUUEFTUzogZmFub3RpZnlfaW5pdCh0Yy0+aW5pdC5mbGFn
cywgT19SRE9OTFkpIHJldHVybmVkIGZkIDUKPiA+IGZhbm90aWZ5MTQuYzoyODM6IFRJTkZPOiBU
ZXN0aW5nIEZBTl9NQVJLX0lOT0RFIHdpdGggSU5PREVfRVZFTlRTCj4gPiBmYW5vdGlmeTE0LmM6
Mjg1OiBUUEFTUzogZmFub3RpZnlfbWFyayhmYW5vdGlmeV9mZCwgMHgwMDAwMDAwMSB8IHRjLT5t
YXJrLmZsYWdzLCB0Yy0+bWFzay5mbGFncywgZGlyZmQsIHBhdGgpIDogRUlOVkFMICgyMikKPiA+
IGZhbm90aWZ5MTQuYzoyNDY6IFRJTkZPOiBUZXN0IGNhc2UgMzogZmFub3RpZnlfaW5pdChGQU5f
Q0xBU1NfTk9USUYgfCBGQU5fUkVQT1JUX0ZJRCwgT19SRE9OTFkpCj4gPiBmYW5vdGlmeTE0LmM6
MjYzOiBUUEFTUzogZmFub3RpZnlfaW5pdCh0Yy0+aW5pdC5mbGFncywgT19SRE9OTFkpIHJldHVy
bmVkIGZkIDUKPiA+IGZhbm90aWZ5MTQuYzoyODM6IFRJTkZPOiBUZXN0aW5nIEZBTl9NQVJLX01P
VU5UIHdpdGggSU5PREVfRVZFTlRTCj4gPiBmYW5vdGlmeTE0LmM6Mjg1OiBUUEFTUzogZmFub3Rp
ZnlfbWFyayhmYW5vdGlmeV9mZCwgMHgwMDAwMDAwMSB8IHRjLT5tYXJrLmZsYWdzLCB0Yy0+bWFz
ay5mbGFncywgZGlyZmQsIHBhdGgpIDogRUlOVkFMICgyMikKPiA+IGZhbm90aWZ5MTQuYzoyNDY6
IFRJTkZPOiBUZXN0IGNhc2UgNDogZmFub3RpZnlfaW5pdChGQU5fQ0xBU1NfTk9USUYgfCBGQU5f
UkVQT1JUX05BTUUsIE9fUkRPTkxZKQo+ID4gZmFub3RpZnkxNC5jOjI2MDogVFBBU1M6IGZhbm90
aWZ5X2luaXQodGMtPmluaXQuZmxhZ3MsIE9fUkRPTkxZKSA6IEVJTlZBTCAoMjIpCj4gPiBmYW5v
dGlmeTE0LmM6MjQ2OiBUSU5GTzogVGVzdCBjYXNlIDU6IGZhbm90aWZ5X2luaXQoRkFOX0NMQVNT
X05PVElGIHwgRkFOX1JFUE9SVF9GSUQgfCBGQU5fUkVQT1JUX05BTUUsIE9fUkRPTkxZKQo+ID4g
ZmFub3RpZnkxNC5jOjI2MDogVFBBU1M6IGZhbm90aWZ5X2luaXQodGMtPmluaXQuZmxhZ3MsIE9f
UkRPTkxZKSA6IEVJTlZBTCAoMjIpCj4gPiBmYW5vdGlmeTE0LmM6MjQ2OiBUSU5GTzogVGVzdCBj
YXNlIDY6IGZhbm90aWZ5X2luaXQoRkFOX0NMQVNTX05PVElGIHwgRkFOX1JFUE9SVF9UQVJHRVRf
RklEIHwgRkFOX1JFUE9SVF9ERklEX05BTUUsIE9fUkRPTkxZKQo+ID4gZmFub3RpZnkxNC5jOjI2
MDogVFBBU1M6IGZhbm90aWZ5X2luaXQodGMtPmluaXQuZmxhZ3MsIE9fUkRPTkxZKSA6IEVJTlZB
TCAoMjIpCj4gPiBmYW5vdGlmeTE0LmM6MjQ2OiBUSU5GTzogVGVzdCBjYXNlIDc6IGZhbm90aWZ5
X2luaXQoRkFOX0NMQVNTX05PVElGIHwgRkFOX1JFUE9SVF9UQVJHRVRfRklEIHwgRkFOX1JFUE9S
VF9ERklEX0ZJRCwgT19SRE9OTFkpCj4gPiBmYW5vdGlmeTE0LmM6MjYwOiBUUEFTUzogZmFub3Rp
ZnlfaW5pdCh0Yy0+aW5pdC5mbGFncywgT19SRE9OTFkpIDogRUlOVkFMICgyMikKPiA+IGZhbm90
aWZ5MTQuYzoyNDY6IFRJTkZPOiBUZXN0IGNhc2UgODogZmFub3RpZnlfaW5pdChGQU5fQ0xBU1Nf
Tk9USUYgfCBGQU5fUkVQT1JUX0RGSURfRklELCBPX1JET05MWSkKPiA+IGZhbm90aWZ5MTQuYzoy
NjM6IFRQQVNTOiBmYW5vdGlmeV9pbml0KHRjLT5pbml0LmZsYWdzLCBPX1JET05MWSkgcmV0dXJu
ZWQgZmQgNQo+ID4gZmFub3RpZnkxNC5jOjI4MzogVElORk86IFRlc3RpbmcgRkFOX01BUktfSU5P
REUgd2l0aCBGQU5fUkVOQU1FCj4gPiBmYW5vdGlmeTE0LmM6Mjg1OiBUUEFTUzogZmFub3RpZnlf
bWFyayhmYW5vdGlmeV9mZCwgMHgwMDAwMDAwMSB8IHRjLT5tYXJrLmZsYWdzLCB0Yy0+bWFzay5m
bGFncywgZGlyZmQsIHBhdGgpIDogRUlOVkFMICgyMikKPiA+IGZhbm90aWZ5MTQuYzoyNDY6IFRJ
TkZPOiBUZXN0IGNhc2UgOTogZmFub3RpZnlfaW5pdChGQU5fQ0xBU1NfTk9USUYsIE9fUkRPTkxZ
KQo+ID4gZmFub3RpZnkxNC5jOjI2MzogVFBBU1M6IGZhbm90aWZ5X2luaXQodGMtPmluaXQuZmxh
Z3MsIE9fUkRPTkxZKSByZXR1cm5lZCBmZCA1Cj4gPiBmYW5vdGlmeTE0LmM6MjgzOiBUSU5GTzog
VGVzdGluZyBGQU5fTUFSS19PTkxZRElSIHdpdGggRkFOX09QRU4KPiA+IGZhbm90aWZ5MTQuYzoy
ODU6IFRQQVNTOiBmYW5vdGlmeV9tYXJrKGZhbm90aWZ5X2ZkLCAweDAwMDAwMDAxIHwgdGMtPm1h
cmsuZmxhZ3MsIHRjLT5tYXNrLmZsYWdzLCBkaXJmZCwgcGF0aCkgOiBFTk9URElSICgyMCkKPiA+
IGZhbm90aWZ5MTQuYzoyOTg6IFRQQVNTOiBBZGRpbmcgYW4gaW5vZGUgbWFyayBvbiBkaXJlY3Rv
cnkgZGlkIG5vdCBmYWlsIHdpdGggRU5PVERJUiBlcnJvciBhcyBvbiBub24tZGlyIGlub2RlCj4g
PiBmYW5vdGlmeTE0LmM6MjQ2OiBUSU5GTzogVGVzdCBjYXNlIDEwOiBmYW5vdGlmeV9pbml0KEZB
Tl9DTEFTU19OT1RJRiB8IEZBTl9SRVBPUlRfREZJRF9OQU1FX1RBUkdFVCwgT19SRE9OTFkpCj4g
PiBmYW5vdGlmeTE0LmM6MjYzOiBUUEFTUzogZmFub3RpZnlfaW5pdCh0Yy0+aW5pdC5mbGFncywg
T19SRE9OTFkpIHJldHVybmVkIGZkIDUKPiA+IGZhbm90aWZ5MTQuYzoyODM6IFRJTkZPOiBUZXN0
aW5nIEZBTl9NQVJLX0lOT0RFIHdpdGggRkFOX0RFTEVURQo+ID4gZmFub3RpZnkxNC5jOjI4NTog
VFBBU1M6IGZhbm90aWZ5X21hcmsoZmFub3RpZnlfZmQsIDB4MDAwMDAwMDEgfCB0Yy0+bWFyay5m
bGFncywgdGMtPm1hc2suZmxhZ3MsIGRpcmZkLCBwYXRoKSA6IEVOT1RESVIgKDIwKQo+ID4gZmFu
b3RpZnkxNC5jOjI5ODogVFBBU1M6IEFkZGluZyBhbiBpbm9kZSBtYXJrIG9uIGRpcmVjdG9yeSBk
aWQgbm90IGZhaWwgd2l0aCBFTk9URElSIGVycm9yIGFzIG9uIG5vbi1kaXIgaW5vZGUKPiA+IGZh
bm90aWZ5MTQuYzozMDM6IFRCUk9LOiBmYW5vdGlmeV9tYXJrKDUsIDB4MTAxLCAweDIwMCwgLi4u
LCBtbnRwb2ludC9maWxlMSkgdW5zdXBwb3J0ZWQ6IEVPUE5PVFNVUFAgKDk1KQo+ID4KPiA+IFJl
cG9ydGVkLWJ5OiBEb21pbmlxdWUgTGV1ZW5iZXJnZXIgPGRsZXVlbmJlcmdlckBzdXNlLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+Cj4gVGhhbmtz
IGZvciBsb29raW5nIGludG8gdGhpcy4gU28gRU9QTk9UU1VQUCBpcyBleHBlY3RlZCB3aXRoIGEK
PiBGQU5fTUFSS19GSUxFU1lTVEVNIGJlY2F1c2UgZXhmYXQgZG9lcyBub3QgaGF2ZSBleHBvcnQg
b3BlcmF0aW9ucyBhbmQgdGh1cwo+IGNhbm5vdCBkZWNvZGUgZmlsZSBoYW5kbGVzICh3aGljaCBp
cyBuZWVkZWQgZm9yIHNlbnNpYmxlIHVzZSBvZiBmaWxlc3lzdGVtCj4gbWFya3MpLgo+Cj4gSSB0
aGluayB3ZSBzaG91bGQganVzdCBpZ25vcmUgdGhpcyBmYWlsdXJlIGluIHRoZSB0ZXN0LiBBbWly
PwoKTm8uIEkgYWxyZWFkeSBoYXZlIHNlbnQgcGF0Y2hlcyB0byBza2lwIGZpbGVzeXN0ZW0vbW91
bnQgbWFya3MKZm9yIHRob3NlIGZpbGVzeXN0ZW1zLgoKVGhhbmtzLApBbWlyLgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
