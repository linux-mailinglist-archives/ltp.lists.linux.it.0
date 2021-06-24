Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA043B3112
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 16:13:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CA003C6F40
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 16:13:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CED6F3C2B48
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 16:13:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2C0021000600
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 16:13:54 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CC371FD89;
 Thu, 24 Jun 2021 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624544034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCGO3J4qYdeJjebNjMieqVkfhKZ3rVRsYNdFnFGZL9c=;
 b=juxxhRawhwv4mUbaiasaDOnQN34JV1fbtz6qNBWEcjaDhwc9eF3Lov32zvX4KWLFPs/yVs
 QJkVQSgHud+y8F/3Ukn0oj3JruoMtkgIpEXH2LV8EDmc49YIUQnry+Fei3guWE9tv1tVf0
 T/8AtyrJQ9eNRZ1NkeoX6Iycc1LKH9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624544034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCGO3J4qYdeJjebNjMieqVkfhKZ3rVRsYNdFnFGZL9c=;
 b=ho3HHePW9rcuLP38d/iGqfEZW3CoGu69659FYXCtgC6KKm+onUfM9Dig4IGwKuFHuD4G4Z
 tf7HgLYfQ4uH2XBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5B52C11A97;
 Thu, 24 Jun 2021 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624544034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCGO3J4qYdeJjebNjMieqVkfhKZ3rVRsYNdFnFGZL9c=;
 b=juxxhRawhwv4mUbaiasaDOnQN34JV1fbtz6qNBWEcjaDhwc9eF3Lov32zvX4KWLFPs/yVs
 QJkVQSgHud+y8F/3Ukn0oj3JruoMtkgIpEXH2LV8EDmc49YIUQnry+Fei3guWE9tv1tVf0
 T/8AtyrJQ9eNRZ1NkeoX6Iycc1LKH9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624544034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCGO3J4qYdeJjebNjMieqVkfhKZ3rVRsYNdFnFGZL9c=;
 b=ho3HHePW9rcuLP38d/iGqfEZW3CoGu69659FYXCtgC6KKm+onUfM9Dig4IGwKuFHuD4G4Z
 tf7HgLYfQ4uH2XBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yTh5FSKT1GBPdwAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Thu, 24 Jun 2021 14:13:54 +0000
To: Li Wang <liwang@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
 <018a369f-473b-524d-f81b-eb8be4df49bb@suse.cz>
 <CAEemH2eSNnhwnOOOMoUf5Xv0uup_ZTJMDncLsgkChcULY37RfQ@mail.gmail.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <2cd76a1c-d944-d19b-ce21-1696602573c4@suse.cz>
Date: Thu, 24 Jun 2021 16:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2eSNnhwnOOOMoUf5Xv0uup_ZTJMDncLsgkChcULY37RfQ@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: memutils: don't pollute entire system memory
 to avoid OoM
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjQuIDA2LiAyMSAxNjowMCwgTGkgV2FuZyB3cm90ZToKPiBGWUksIEFub3RoZXIgcmVsYXRl
ZCBhbmFseXNpczoKPiBodHRwczovL2xpc3RzLmxpbnV4Lml0L3BpcGVybWFpbC9sdHAvMjAyMS1B
cHJpbC8wMjE5MDMuaHRtbAo+IDxodHRwczovL2xpc3RzLmxpbnV4Lml0L3BpcGVybWFpbC9sdHAv
MjAyMS1BcHJpbC8wMjE5MDMuaHRtbD4KPiAKPiBUaGUgbW1hcCgpIGJlaGF2aW9yIGNoYW5nZWQg
aW4gR1VFU1MgbW9kZSBmcm9tIGNvbW1pdCA4Yzc4MjliMDRjNTIzY2QsCj4gd2UgY2FuIE5PVCBy
ZWNlaXZlIE1BUF9GQUlMRUQgb24gRU5PTUVNIGluIHVzZXJzcGFjZSBhbnltb3JlLHVubGVzc8Kg
Cj4gdGhlIHByb2Nlc3Mgb25lLXRpbWUgYWxsb2NhdGluZyBtZW1vcnkgbGFyZ2VyIHRoYW4gInRv
dGFsX3JhbSsKPiB0b3RhbF9zd2FwIiBleHBsaWNpdGx5Lgo+IAo+IFdoaWNoIGFsc28gbWVhbnMg
dGhlIE1BUF9GQUlMRUQgY2hlY2sgbG9zZSBlZmZlY3TCoHBlcm1hbmVudGx5IGluIGxpbmUjNTE6
Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0ZXIv
bGliL3RzdF9tZW11dGlscy5jI0w1MQo+IDxodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1w
cm9qZWN0L2x0cC9ibG9iL21hc3Rlci9saWIvdHN0X21lbXV0aWxzLmMjTDUxPgoKSSdtIHByZXR0
eSBzdXJlIHRoYXQgMzJiaXQgeDg2IGtlcm5lbCB3aXRoIFBBRSBhbmQgbW9yZSB0aGFuIDNHQiBv
ZiBSQU0Kd2lsbCBnaXZlIHlvdSBNQVBfRkFJTEVEIGJlY2F1c2UgeW91J2xsIHJ1biBvdXQgb2Yg
YXZhaWxhYmxlIGFkZHJlc3MKc3BhY2UgYmVmb3JlIHlvdSBydW4gb3V0IG9mIHBoeXNpY2FsIG1l
bW9yeS4KCi0tIApNYXJ0aW4gRG91Y2hhICAgbWRvdWNoYUBzdXNlLmN6ClFBIEVuZ2luZWVyIGZv
ciBTb2Z0d2FyZSBNYWludGVuYW5jZQpTVVNFIExJTlVYLCBzLnIuby4KQ09SU08gSUlhCktyaXpp
a292YSAxNDgvMzQKMTg2IDAwIFByYWd1ZSA4CkN6ZWNoIFJlcHVibGljCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
