Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D73836F8EC
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 13:06:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D07563C5EAF
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 13:06:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F1BE3C2778
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 13:06:52 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 82EEF6005DD
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 13:06:51 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 7A9959FBB1;
 Fri, 30 Apr 2021 11:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1619780809; bh=OYw3TYFwBHGnctKpyzjCxX+OLkgpSc2Vb+wufcHYdys=;
 h=To:From:Subject:Message-ID:Date:MIME-Version;
 b=i9L02BurnM5lSaTAQYBjlak7YYifpNJF9kV/JySNntrhpRsCqsmjZqOxYaK+IAffd
 0XKVuoJZ8XljnkXDO0I0R+1r8oUuL5Gsfj4eXQGTvZgJBdfve0JRTAzkp3FIjWKi3C
 ZTdY5MN2MI4svlgUSgrfrAJxbLugIVRQKZI6aNlk=
To: LTP List <ltp@lists.linux.it>, Petr Vorel <pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
Date: Fri, 30 Apr 2021 13:08:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [RFC] Shell API timeout sleep orphan processes
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpJIGFtIGxvb2tpbmcgaW50byBnZXR0aW5nIHJpZCBvZiBvdXIgY3VzdG9tIHBhdGNoZXMg
Zm9yIGx0cC4KT25lIG9mIHRoZXNlIHBhdGNoZXMgZml4ZXMgdGhlIHByb2JsZW0sIHRoYXQgdGhl
IHRpbWVvdXQgc2xlZXAgcHJvY2VzcyAKaXMgb3JwaGFuZWQsIGlmIHRoZSB0ZXN0IGRvZXMgbm90
IHRpbWVvdXQuCgpUaGUga2lsbCBjb2RlIGlzIG5vdCB3b3JraW5nIGFzIGV4cGVjdGVkLCBiZWNh
dXNlIGl0IG9ubHkga2lsbHMgdGhlIApzaGVsbCBwcm9jZXNzIHNwYXduZWQgYnkgInNsZWVwICRz
ZWMgJiYgX3RzdF9raWxsX3Rlc3QgJiIuCldlIGFyZSBydW5uaW5nIHNpbmdsZSBsdHAgdGVzdHMg
dXNpbmcgcm9ib3QgZnJhbWV3b3JrIGFuZCByb2JvdCB3YWl0cyAKdW50aWwgYWxsIHByb2Nlc3Nl
cyBvZiBzZXNzaW9uIGhhdmUgZmluaXNoZWQuCgpUaGlzIGNhbiBhbHNvIGJlIHNlZW4gYnkgcGlw
aW5nIHRoZSBvdXRwdXQgb2YgYSB0ZXN0cnVuIGludG8gY2F0IChlZy4gCndpdGggdGltZW91dDAy
LnNoIGZyb20gbmV3bGliX3Rlc3Qvc2hlbGwpOgokIHRpbWUgc2ggLWMgJy4vdGltZW91dDAyLnNo
ID4vZGV2L251bGwgfCBjYXQnCnRpbWVvdXQwMiAxIFRJTkZPOiB0aW1lb3V0IHBlciBydW4gaXMg
MGggMG0gMnMKdGltZW91dDAyIDEgVFBBU1M6IHRpbWVvdXQgMiBzZXQgKExUUF9USU1FT1VUX01V
TD0nMScpCgpbc25pcF0KCnJlYWzCoMKgwqAgMG0yLDAxMXMKCgpUaGUgdGVzdCBkb2VzIG5vdGhp
bmcsIGFuZCBjb21wbGV0ZXMgaW4gPCAxMDBtcy4gVGhpcyBjYW4gYmUgc2VlbiAKd2l0aG91dCBw
aXBpbmcgdGhyb3VnaCBjYXQ6Cgp0aW1lIHNoIC1jICdQQVRIPSIkUFdEOiRQV0QvLi4vLi4vLi4v
dGVzdGNhc2VzL2xpYi86JFBBVEgiIC4vdGltZW91dDAyLnNoJwp0aW1lb3V0MDIgMSBUSU5GTzog
dGltZW91dCBwZXIgcnVuIGlzIDBoIDBtIDJzCnRpbWVvdXQwMiAxIFRQQVNTOiB0aW1lb3V0IDIg
c2V0IChMVFBfVElNRU9VVF9NVUw9JzEnKQoKW3NuaXBdCgpyZWFswqDCoMKgIDBtMCwwMTBzCgoK
SSBhbSBub3Qgc3VyZSB3aGF0IHRoZSBiZXN0IGFwcHJvYWNoIGZvciBmaXhpbmcgdGhlc2Ugc2xl
ZXAgb3JwaGFucyBpcy4gCk91dCBwYXRjaCB1c2VzICJzZXQgLW0iIGFyb3VuZCB0aGUgc3RhcnQg
b2YgdGhlIHRpbWVyLCB0aGlzIG1ha2VzIG1vc3QgCm9mIHRoZSBzaGVsbHMgY3JlYXRlIGEgbmV3
IHByb2Nlc3MgZ3JvdXAsIGJ1dCBpdCBmYWlsZWQgKGF0IGxlYXN0IGRpZCAKbm90IHdvcmspIGlu
IHpzaC4gVGhlIGtpbGxpbmcgb2YgdGhlIHRpbWVvdXQgcHJvY2VzcyBpcyB0aGVuIGNoYW5nZWQg
dG8gCmtpbGwgdGhlIHByb2Nlc3MgZ3JvdXAgKGtpbGwgLS0gLSRfdHN0X3NldHVwX3RpbWVyX3Bp
ZCkuClRoaXMgd29ya3MgZmluZSBhdCBsZWFzdCBmb3Igc29tZSBzaGVsbHMuCgpUaGUgb25seSB3
YXkgdG8gZml4IHRoaXMgcmVhbGx5IHBvcnRhYmxlIEkgY2FuIHRoaW5rIG9mIGlzIG1vdmluZyB0
aGUgCnRpbWVvdXQgY29kZSAoaW5jbHVkaW5nIHRoZSBsb2dpYyBpbiBfdHN0X2tpbGxfdGVzdCkg
aW50byBjIGNvZGUuIFRoaXMgCndheSB0aGVyZSB3b3VsZCBvbmx5IGJlIG9uZSBiaW5hcnksIHRo
YXQgY2FuIGJlIGtpbGxlZCBmbGF3bGVzc2x5LgoKRG8geW91IGhhdmUgYW55IG90aGVyIGlkZWEg
b3IgZG8geW91IHRoaW5rIHRoaXMgImJ1ZyIgaXMgbm90IHJlbGV2YW50IAplbm91Z2ggdG8gYmUg
Zml4ZWQ/CgpUaGFua3MsCkpvZXJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
