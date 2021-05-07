Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A6375F8D
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 06:47:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0D8F3C5604
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 06:47:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14A573C19D6
 for <ltp@lists.linux.it>; Fri,  7 May 2021 06:46:57 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1F66F1000649
 for <ltp@lists.linux.it>; Fri,  7 May 2021 06:46:56 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 8A9B99FBF9;
 Fri,  7 May 2021 04:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620362815; bh=ZPjRRZCrQTKDKs78i/bBWfV2pX+J1bEypBZUs33gv8o=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=HLRocQfgoKR4EaTd3gbYDBtntz17AaOgGpYO/mBdLBo42IvKeX6LYwYWa+nCYsy7v
 ktsZViQwut8WTAdoeCwMRDx1FGvLtRzAcfxnI0cQM0pFLNLfawhbJlmoVTTm/EzfHX
 4VDMaNEPgjqtCHJKneQ3j2rZOXZeCjsJE5usfLqg=
To: Li Wang <liwang@redhat.com>
References: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
 <YJDvIcgdl8ae58YB@pevik> <5fdefbf3-2b4e-f44b-6cb2-c133ecf36975@jv-coder.de>
 <YJEKFLmcKvnHvlIV@pevik> <651cb158-c640-e0b5-a2f2-4b77efcfa288@jv-coder.de>
 <CAEemH2dp4PT=AeEzjkhi3e_BnVbgWL6JvA3xQok5mHbAV9ig5A@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <c9a17829-a7bb-288e-a9fd-2af387b12f1e@jv-coder.de>
Date: Fri, 7 May 2021 06:48:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dp4PT=AeEzjkhi3e_BnVbgWL6JvA3xQok5mHbAV9ig5A@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC] Shell API timeout sleep orphan processes
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgo+IChTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIEkgd2FzIGp1c3QgYmFjayBmcm9t
IHRoZSBIb2xpZGF5cykKPgo+IEJlZm9yZSB3ZSBkZWNpZGUgdG8gcmV3cml0ZSBpbiBDLCBjYW4g
d2UgdGhpbmsgYWJvdXQgdGhpcyBiZWxvdyBtZXRob2Q/Cj4KPiAtLS0gYS90ZXN0Y2FzZXMvbGli
L3RzdF90ZXN0LnNoCj4gKysrIGIvdGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaAo+IEBAIC0yNiw3
ICsyNiw3IEBAIHRyYXAgInRzdF9icmsgVEJST0sgJ3Rlc3QgaW50ZXJydXB0ZWQgb3IgdGltZWQg
b3V0JyIgSU5UCj4gICBfdHN0X2NsZWFudXBfdGltZXIoKQo+ICAgewo+ICAgICAgICAgIGlmIFsg
LW4gIiRfdHN0X3NldHVwX3RpbWVyX3BpZCIgXTsgdGhlbgo+IC0gICAgICAgICAgICAgICBraWxs
ICRfdHN0X3NldHVwX3RpbWVyX3BpZCAyPi9kZXYvbnVsbAo+ICsgICAgICAgICAgICAgICBraWxs
IC1URVJNICRfdHN0X3NldHVwX3RpbWVyX3BpZCAyPi9kZXYvbnVsbAo+ICAgICAgICAgICAgICAg
ICAgd2FpdCAkX3RzdF9zZXR1cF90aW1lcl9waWQgMj4vZGV2L251bGwKPiAgICAgICAgICBmaQo+
ICAgfQo+IEBAIC00ODYsNyArNDg2LDcgQEAgX3RzdF9zZXR1cF90aW1lcigpCj4gICAgICAgICAg
dHN0X3JlcyBUSU5GTyAidGltZW91dCBwZXIgcnVuIGlzICR7aH1oICR7bX1tICR7c31zIgo+Cj4g
ICAgICAgICAgX3RzdF9jbGVhbnVwX3RpbWVyCj4gLSAgICAgICBzbGVlcCAkc2VjICYmIF90c3Rf
a2lsbF90ZXN0ICYKPiArICAgICAgICh0cmFwICdraWxsICQhOyBleGl0JyBURVJNOyBzbGVlcCAk
c2VjICYgd2FpdCAkISAmJiBfdHN0X2tpbGxfdGVzdCkmCj4KPiAgICAgICAgICBfdHN0X3NldHVw
X3RpbWVyX3BpZD0kIQo+ICAgfQpUaGFua3MsIGdvb2QgaWRlYS4gVGhpcyBsb29rcyBsaWtlIGl0
IHdvcmtzLiBNeSB0ZXN0cyBhcmUgcGFzc2luZy4gSSAKd2lsbCB0ZXN0IHRoaXMgYSBiaXQgbW9y
ZS4KQWx0aG91Z2ggSSBhbHJlYWR5IHN1Ym1pdHRlZCBhIHJld3JpdGUgaW4gYywgSSB3b3VsZCBw
cmVmZXIgdGhpcyAKc29sdXRpb24sIG1heWJlIHdpdGggYSBiaXQgaW1wcm92ZWQgcmVhZGFiaWxp
dHkuCkkgd2lsbCBwb3N0IGEgbmV3IHBhdGNoIHdoZW4gSSBmaW5pc2hlZCB0ZXN0aW5nIGxhdGVy
IHRvZGF5LgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
