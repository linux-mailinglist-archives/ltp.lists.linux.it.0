Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC93B7F4C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 18:41:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94BE23C2167
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 18:41:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 627D93C2158
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 18:41:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7D93F600C47
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 18:41:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24CB369BC5;
 Thu, 19 Sep 2019 16:41:53 +0000 (UTC)
Date: Thu, 19 Sep 2019 18:41:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Lanig <clanig@suse.com>
Message-ID: <20190919164151.GB20853@x230>
References: <20181003113215.GB21139@dell5510>
 <cover.1566500817.git.clanig@suse.com>
 <ce675759672af52bea02c11d51bd7d10f0bcb5cb.1566500817.git.clanig@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce675759672af52bea02c11d51bd7d10f0bcb5cb.1566500817.git.clanig@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/1] Add automated tests for shell lib
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ2hyaXN0aWFuLAoKdGhhbmsgeW91IGZvciB3b3JraW5nIG9uIGl0LgoKVEw7RFI6IGxvb2tz
IGdvb2QgdG8gbWUsIEkgaGF2ZSBzb21lIGNvZGUgc3R5bGUgb2JqZWN0aW9ucywKKHVzZSBlY2hv
IGluc3RlYWQgb2YgcHJpbnRmLCB1c2UgJGZvbyBpbnN0ZWFkIG9mICR7Zm9vfSB3aGVuIHBvc3Np
YmxlKQorIHNvbWUgbWlub3Igc3VnZ2VzdGlvbnMgYmVsb3cuCgo+ICsrKyBiL2RvYy93cml0ZS10
ZXN0cy1mb3Itc2hlbGwtbGliLnR4dAo+IEBAIC0wLDAgKzEsNTkgQEAKPiArSG93IHRvIGZvcm1h
dCB0ZXN0cyBpbiBvcmRlciB0byB0ZXN0IHRoZSBzaGVsbCBsaWJyYXJ5Cj4gKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArSXQgaXMg
aW1wb3J0YW50IHRvIHRlc3QgdGhlIExpbnV4IGtlcm5lbCBmdW5jdGlvbmFsaXR5IGJ1dCBhbHNv
IHRvIG1ha2Ugc3VyZQo+ICt0aGF0IExUUCBpcyBydW5uaW5nIGNvcnJlY3RseSBpdHNlbGYuIEZv
ciB0aGlzIHJlYXNvbiBpdCBpcyB1c2VmdWwgdG8gdGVzdAo+ICtpbnRyaW5zaWMgZnVuY3Rpb25h
bGl0eSBvZiBMVFAuCj4gKwo+ICsxLiBSdW5uaW5nIHRlc3RzIGZvciB0aGUgc2hlbGwgbGlicmFy
eQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICtUaGUgdGVzdCBj
YXNlcyByZXNpZGUgaW4gdGhlIGZvbGRlciBgbGliL25ld2xpYl90ZXN0cy9zaGVsbGAuIEEgc2Ny
aXB0IGV4ZWN1dGluZwo+ICt0aGVtIG9uZSBieSBvbmUgaXMgbG9jYXRlZCBpbiB0aGUgZm9sZGVy
IGBsaWIvbmV3bGliX3Rlc3RzYC4gWW91IGNhbiBleGVjdXRlCj4gK3RoaXMgc2NyaXB0IHRvIHRl
c3QgYWxsIGNhc2VzIG9yIHNwZWNpZnkgdGVzdCBjYXNlcyB0byBiZSBydW4uIFRoZSBzY3JpcHQg
aXMKPiArY2FsbGVkIGB0ZXN0X3NoX25ld2xpYi5zaGAuCj4gKwo+ICsyLiBXcml0aW5nIHRlc3Rz
IGZvciB0aGUgc2hlbGwgbGlicmFyeQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICtUaGUgdGVzdHMgYXJlIHdyaXR0ZW4gbGlrZSBhbGwgb3RoZXIgdGVzdCBjYXNl
cyB1c2luZyB0aGUgc2hlbGwgbGlicmFyeS4KPiArQWRkaXRpb25hbGx5LCBhdCB0aGUgZW5kIG9m
IHRoZSBmaWxlIHRoZSBkZXNpcmVkIG91dHB1dCBpcyBhZGRlZC4gQXMgYW4gZXhhbXBsZToKTmlj
ZS4gSSB3b25kZXIgaWYgaXQgc2hvdWxkIGJlIGluIGRvYy90ZXN0LXdyaXRpbmctZ3VpZGVsaW5l
cy50eHQuIEJ1dCB0aGlzCnNlY3Rpb24gaXMgYWxyZWFkeSB0b28gYmlnLCBzbyBpdCdzIHByb2Jh
Ymx5IGdvb2QgdGhhdCBpdCdzIHNlcGFyYXRlLgpUaGVuIHdlIG5lZWQgdG8gYWRkIHBhZ2UgdGhp
cyB0byB3aWtpIChzaW1wbGUpLgoKQlRXIEkgcGxhbiB0byBpbnRyb2R1Y2UgbWFrZSBjaGVjaywg
d2hpY2ggd2lsbCBydW4gdGhpcyBhbmQgb3RoZXIgY2hlY2tzIGFzIHdlbGwuCgo+ICsKPiArW3Nv
dXJjZSxzaGVsbF0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsjIS9iaW4vc2gKPiArIwo+
ICsjIFRoaXMgaXMgYSBiYXNpYyB0ZXN0IGZvciB0cnVlIHNoZWxsIGJ1aWxkaW4KdHlwbzogYnVp
bHRpbgo+ICsjCm5pdDogSSdkIHJlbW92ZSB0aGlzIGVtcHR5IGxpbmVzIGp1c3Qgd2l0aCAnIycK
PiArCj4gK1RTVF9URVNURlVOQz1kb190ZXN0Cj4gKy4gdHN0X3Rlc3Quc2gKPiArCj4gK2RvX3Rl
c3QoKQo+ICt7Cj4gKwl0cnVlCj4gKwlyZXQ9JD8KPiArCj4gKwl0c3RfcmVzIFRJTkZPICJUZXN0
ICQxIHBhc3NlZCB3aXRoIG5vIGRhdGEgKCckMicpIgo+ICsKPiArCWlmIFsgJHJldCAtZXEgMCBd
OyB0aGVuCj4gKwkJdHN0X3JlcyBUUEFTUyAidHJ1ZSByZXR1cm5lZCAwIgo+ICsJZWxzZQo+ICsJ
CXRzdF9yZXMgVEZBSUwgInRydWUgcmV0dXJuZWQgJHJldCIKPiArCWZpCj4gK30KPiArCj4gK3Rz
dF9ydW4KPiArIyBvdXRwdXQ6Cj4gKyMgdGVzdCAxIFRJTkZPOiBUZXN0IDEgcGFzc2VkIHdpdGgg
bm8gZGF0YSAoJycpCj4gKyMgdGVzdCAxIFRQQVNTOiB0cnVlIHJldHVybmVkIDAKPiArIwo+ICsj
IFN1bW1hcnk6Cj4gKyMgcGFzc2VkICAgMQo+ICsjIGZhaWxlZCAgIDAKPiArIyBza2lwcGVkICAw
Cj4gKyMgd2FybmluZ3MgMAo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtUaGUgbW9z
dCBub3RpY2VhYmxlIHRoaW5nIGlzIHRvIGFkZCB0aGUgbGluZSBgIyBvdXRwdXQ6YCB0byBzaG93
IHRoZSBwYXJzZXIgdGhhdAo+ICtwYXJzaW5nIHNob3VsZCBzdGFydCBpbiB0aGUgZm9sbG93aW5n
IGxpbmUuIEZvciB0aGUgZm9sbG93aW5nIGxpbmVzIHRoZSBgIyBgCj4gK3dpbGwgYmUgc3RyaXBw
ZWQgYmVmb3JlIHRoZSBvdXRwdXQgaXMgdGhlbiBjb21wYXJlZCB3aXRoIHRoZSBhY3R1YWwgb3V0
cHV0IHRoYXQKPiArZ2V0cyBwcmludGVkIG9uIHRoZSB0ZXJtaW5hbCB3aGVuIHJ1bm5pbmcgdGhl
IHRlc3QuCj4gZGlmZiAtLWdpdCBhL2xpYi9uZXdsaWJfdGVzdHMvc2hlbGwvdGVzdF9zaF9uZXds
aWIuc2ggYi9saWIvbmV3bGliX3Rlc3RzL3NoZWxsL3Rlc3Rfc2hfbmV3bGliLnNoCj4gbmV3IGZp
bGUgbW9kZSAxMDA3NTUKPiBpbmRleCAwMDAwMDAwMDAuLjRhYTE5NTU1Ygo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9saWIvbmV3bGliX3Rlc3RzL3NoZWxsL3Rlc3Rfc2hfbmV3bGliLnNoCj4gQEAg
LTAsMCArMSwxMDIgQEAKPiArIyEvYmluL3NoCj4gKyMKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICsjIChjKSAyMDE5IFNVU0UgTExDCj4gKyMKPiArIyBB
dXRob3I6IENocmlzdGlhbiBMYW5pZyA8Y2xhbmlnQHN1c2UuY29tPgo+ICsKPiArUEFUSD0iJHtQ
QVRIfTokKGRpcm5hbWUgJChyZWFkbGluayAtZiAkMCkpLy4uLy4uLy4uL3Rlc3RjYXNlcy9saWIv
Igo+ICtpZiBbIC16ICIkVE1QRElSIiBdOyB0aGVuCj4gKwlleHBvcnQgVE1QRElSPSIvdG1wIgo+
ICtmaQo+ICtjb2xvcl9ibHVlPSdcMDMzWzE7MzRtJwo+ICtjb2xvcl9ncmVlbj0nXDAzM1sxOzMy
bScKPiArY29sb3JfcmVkPSdcMDMzWzE7MzFtJwo+ICtyZXNldF9hdHRyPSdcMDMzWzBtJwpJJ2Qg
cHJlZmVyIG5vdCByZWltcGxlbWVudGluZyB0c3RfYW5zaV9jb2xvci5zaC4KSU1ITyBpdCdkIGJl
IGJldHRlciBlaXRoZXIgdXNlIHBhcnQgb2YgaXQgKG9yIHRzdF9hbnNpX2NvbG9yLnNoKQpvciBu
b3QgdXNlIGNvbG9ycyBhdCBhbGwuCgo+ICt0bXA9IiR7VE1QRElSfS9zaF9saWJfdHN0LSR7JH0v
IgpuaXQ6IGl0IGNhbiBiZSAkJCAoaW5zdGVhZCBvZiAkeyR9KQo+ICtta2RpciAkdG1wIHx8IGNs
ZWFudXAgMQo+ICtwYXJlbnRfZGlyPSQoZGlybmFtZSAkKHJlYWRsaW5rIC1mICQwKSkvCj4gK3Rv
b2xkaXI9JHtwYXJlbnRfZGlyfS8uLi8uLi8uLi90b29scy8KPiArdGVzdGRpcj0ke3BhcmVudF9k
aXJ9dGVzdGNhc2VzLwo+ICt0c3RfZmlsZXM9JChscyAkdGVzdGRpcikKPiArCj4gK2NsZWFudXAo
KQo+ICt7Cj4gKwlbIC1kICIkdG1wIiBdICYmIHJtIC1yZiAiJHRtcCIKbml0OiAxIGNvdWxkIGJl
IGEgZGVmYXVsdCBwYXJhbWV0ZXIuCj4gKwlleGl0ICQxCj4gK30KPiArCj4gK3ByaW50X2hlbHAo
KQo+ICt7Cj4gKwljYXQgPDxFT0YKPiArCj4gK+KUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkAo+ICvilIIgVGhpcyBTaGVs
bCBzY3JpcHQgaXRlcmF0ZXMgb3ZlciB0ZXN0IGNhc2VzIGZvciB0aGUgbmV3IFNoZWxsIGxpYnJh
cnkgYW5kICAgICDilIIKPiAr4pSCIHZlcmlmaWVzIHRoZSBvdXRwdXQuICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg4pSCCj4gK+KUlOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUmApuaXQ6IEknZCBwcmVmZXIgdG8gdXNlIEFTQ0lJICgtKSB0aGFuIHVuaWNvZGUgKOKUgCku
Cgo+ICsKPiArCVVzYWdlOgo+ICsJCSQoYmFzZW5hbWUgJDApIFtURVNUX0ZJTEVfMV0gW1RFU1Rf
RklMRV8yXQo+ICsKbml0OiBhbm90aGVyIHNwYWNlIG5vdCBuZWVkZWQuCj4gK0VPRgo+ICsJZXhp
dCAwCj4gK30KPiArCj4gK3BhcnNlX3BhcmFtcygpCj4gK3sKPiArCVsgLW4gIiQxIiBdICYmIHRz
dF9maWxlcz0KPiArCXdoaWxlIFsgLW4gIiQxIiBdOyBkbwpXZSB1c3VhbGx5IHByZWZlciB0byB1
c2UgZ2V0b3B0cywgd2hpY2ggZG9lcyBub3QgYWxsb3cgbG9uZyBvcHRzLgpJdCdzIG9rIGZvciB0
aGlzIHNtYWxsIHVzYWdlLCBidXQgZm9yIG1vcmUgY29tcGxpY2F0ZWQgb3V0cHV0IGl0J3MgYmV0
dGVyIG5vdApyZWltcGxlbWVudGluZyBpdC4KPiArCQljYXNlICIkMSIgaW4KPiArCQkJLS1oZWxw
KSBwcmludF9oZWxwOzsKPiArCQkJLWgpIHByaW50X2hlbHA7Owo+ICsJCQktKikKPiArCQkJCXBy
aW50ZiAiVW5rbm93biBwb3NpdGlvbmFsIHBhcmFtZXRlciAkezF9LlxuIgptYXliZSB1c2Ugc2lt
cGxlIHRoaXMgc2ltcGxlciBmb3JtOgoJCQkJZWNobyAiVW5rbm93biBwb3NpdGlvbmFsIHBhcmFt
ZXRlciAkMSIKCj4gKwkJCQljbGVhbnVwIDE7Owo+ICsJCQkqKSB0c3RfZmlsZXM9IiR0c3RfZmls
ZXMgJDEiOzsKPiArCQllc2FjCj4gKwkJc2hpZnQKPiArCWRvbmUKPiArfQo+ICsKPiArdmVyaWZ5
X291dHB1dCgpCj4gK3sKPiArCWlmIFsgISAtZSAiJHt0ZXN0ZGlyfSR0c3QiIF07IHRoZW4KVGhp
cyBjYW4gc2FmZWx5IGJlICIkdGVzdGRpciR0c3QiCj4gKwkJcHJpbnRmICIkdHN0IG5vdCBmb3Vu
ZFxuIgpBZ2FpbiwgdXNlIGVjaG8KPiArCQljbGVhbnVwIDEKPiArCWZpCj4gKwo+ICsJJHt0b29s
ZGlyfWxvb2t1cF9zcGxpdF9jdXQucHkgLWYgJHt0ZXN0ZGlyfSR0c3QgLWQgJHRtcCBcCj4gKwkJ
CS1zICcjIG91dHB1dDpcbicgLWMgJyMgezAsMX0nIHx8IGNsZWFudXAgMQo+ICsKPiArCSIke3Rl
c3RkaXJ9JHRzdCIgPiAiJHt0bXB9JHRzdC5hY3R1YWwiIHx8IGNsZWFudXAgMQpBZ2FpbiwgJHt9
IGlzIG5vdCBuZWNlc3NhcnkuCj4gKwljbXAgLXMgIiR7dG1wfSR0c3QuYWN0dWFsIiAiJHt0bXB9
JHt0c3R9X291dC9vdXQuMSIgJiYgcmV0dXJuIDAKKyBjaGVjayBmb3IgY21wLgo+ICsJcmV0dXJu
IDEKPiArfQo+ICsKPiArcnVuX3Rlc3RzKCkKPiArewo+ICsJcGFzc19jbnQ9MAo+ICsJZmFpbF9j
bnQ9MAo+ICsJcHJpbnRmICJcbiIKYWdhaW4sIGVjaG8gaXMgYmV0dGVyIGhlcmUuCj4gKwlmb3Ig
dHN0IGluICR0c3RfZmlsZXM7IGRvCj4gKwkJaWYgdmVyaWZ5X291dHB1dDsgdGhlbgo+ICsJCQlw
YXNzX2NudD0kKCgkcGFzc19jbnQgKyAxKSkKPiArCQkJcHJpbnRmICIke2NvbG9yX2dyZWVufVRQ
QVNTJHJlc2V0X2F0dHIgJHt0c3R9XG4iCj4gKwkJZWxzZQo+ICsJCQlmYWlsX2NudD0kKCgkZmFp
bF9jbnQgKyAxKSkKPiArCQkJcHJpbnRmICIke2NvbG9yX3JlZH1URkFJTCRyZXNldF9hdHRyICR7
dHN0fVxuIgo+ICsJCQlwcmludGYgIiR7Y29sb3JfYmx1ZX1EaWZmOiR7cmVzZXRfYXR0cn1cbiIK
PiArCQkJZGlmZiAtdSAiJHt0bXB9JHt0c3R9LmFjdHVhbCIgXApXZSBtaWdodCB3YW50IHRvIGNo
ZWNrIGZvciBkaWZmIGJlaW5nIGF2YWlsYWJsZSBiZWZvcmUgd2UgdXNlLgo+ICsJCQkJCSIke3Rt
cH0ke3RzdH1fb3V0L291dC4xIgo+ICsJCQlwcmludGYgIlxuIgo+ICsJCWZpCj4gKwlkb25lCj4g
KwlwcmludGYgIlxuU3VtbWFyeTpcbiIKPiArCXByaW50ZiAiJHtjb2xvcl9yZWR9RmFpbGVkOiRy
ZXNldF9hdHRyICRmYWlsX2NudFxuIgo+ICsJcHJpbnRmICIke2NvbG9yX2dyZWVufVBhc3NlZDok
cmVzZXRfYXR0ciAkcGFzc19jbnRcblxuIgo+ICsJcmV0dXJuICRmYWlsX2NudAo+ICt9Ci4uLiAo
bW9yZSB0ZXN0cykKCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xvb2t1cF9zcGxpdF9jdXQucHkgYi90
b29scy9sb29rdXBfc3BsaXRfY3V0LnB5Cj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCAw
MDAwMDAwMDAuLjJiMzM4OGFkYQo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy9sb29rdXBf
c3BsaXRfY3V0LnB5Cj4gQEAgLTAsMCArMSwxMjAgQEAKPiArIyEvdXNyL2Jpbi9lbnYgcHl0aG9u
CkkgZ3Vlc3MgdGhpcyBzaG91bGQgYmUgcHl0aG9uMy4KSSdkIGJlIGEgYml0IGNhcmVmdWwgdG8g
YnJpbmcgcHl0aG9uIGFzIGFub3RoZXIgZGVwZW5kZW5jeSwKKHRoZXJlIHdhcyBzb21lIGF3ayBz
b2x1dGlvbiBmb3IgdGhpcywgcHJvcG9zZWQgYnkgQ3lyaWwpLApidXQgYXMgcHl0aG9uIGlzIGV2
ZXJ5d2hlcmUsIGl0IHNob3VsZG4ndCBiZSBhIHByb2JsZW0uCihXZSBkZWZpbml0ZWx5IGRvbid0
IHdhbnQgcHl0aG9uIG9uIFNVVCwgdGhlc2UgdGVzdHMgd2lsbCBiZSBldmVudHVhbGx5CnJld3Jp
dHRlbiBpbnRvIEMgb3Igc2hlbGwuKQoKPiArIwo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyCj4gKyMgKGMpIDIwMTkgU1VTRSBMTEMKPiArIwo+ICsjIEF1dGhv
cjogQ2hyaXN0aWFuIExhbmlnIDxjbGFuaWdAc3VzZS5jb20+Cj4gKwo+ICtpbXBvcnQgc3lzCj4g
K2ltcG9ydCBvcwo+ICtpbXBvcnQgcmUKPiArZnJvbSBzeXMgaW1wb3J0IGFyZ3YKPiArZnJvbSBv
cyBpbXBvcnQgbWFrZWRpcnMsIHBhdGgKPiArCj4gK3NyY19maWxlX3BhdGggPSBOb25lCj4gK2Rl
c3QgPSBOb25lCj4gK2RlbGltID0gTm9uZQo+ICtwYXR0ZXJuID0gTm9uZQo+ICtwZXJpbSA9IE5v
bmUKPiArCj4gK2FyZ3YucmV2ZXJzZSgpCj4gK2Jhc2VuYW1lID0gcGF0aC5zcGxpdChhcmd2LnBv
cCgpKVsxXQo+ICsKPiArZGVmIHByaW50X2hlbHAoKToKPiArCj4gKwloZWxwID0gIiIiCj4gKwlU
aGlzIHNjcmlwdCBjYW4gbG9vayB1cCBhIHBhc3NhZ2UgaW4gYSBzcGVjaWZpZWQgdGV4dCBwYXR0
ZXJuLCBzcGxpdCBhCj4gKwl0ZXh0IGZpbGUgYW5kIGN1dCBhIHBhdHRlcm4uIFRoZSBvcGVyYXRp
b24gY2hhaW4gaXM6Cj4gKwo+ICsJCWxvb2t1cCA+IHNwbGl0ID4gY3V0Cj4gKwo+ICsJVGhlIG91
dHB1dCBmaWxlcyBhcmUgd3JpdHRlbiB0byB0aGUgc3BlY2lmaWVkIGRlc3RpbmF0aW9uIGRpcmVj
dG9yeS4KPiArCj4gKwlVc2FnZToKPiArCSIiIgo+ICsJaGVscCArPSAiXG5cdFx0IiArIGJhc2Vu
YW1lICsgIiAtZiBbUEFUSF0gLWQgW1BBVEhdIC1sICIgXAo+ICsJCQkrICJbUEVSSU1FVEVSXSAt
cyBbREVMSU1JVEVSXSBcbiIgXAo+ICsJCQkrICJcdFx0XHRcdCAtYyBbUEFUVEVSTl1cblxuIgpu
aXQ6IHlvdSBjYW4gdXNlIGZvcm1hdCgpIHRvIHVzZSB2YXJpYWJsZXMgaW4gbXVsdGlsaW5lIHN0
cmluZ3MuCgo+ICsJaGVscCArPSAiIiIKPiArCS1oLCAtLWhlbHAKPiArCQlwcmludCB0aGlzIGhl
bHAKPiArCS1mLCAtLWZpbGUKPiArCQlzb3VyY2UgZmlsZSB0byBiZSBwcm9jZXNzZWQKPiArCS1k
LCAtLWRlc3RpbmF0aW9uCj4gKwkJZGVzdGluYXRpb24gcGF0aAo+ICsJLWwsIC0tbG9va3VwCj4g
KwkJbG9vayBmb3IgZGF0YSBpbiB0ZXh0IHBhc3NhZ2UKPiArCS1zLCAtLXNwbGl0Cj4gKwkJc3Bs
aXQgZmlsZSBieSBkZWxpbWl0ZXIKPiArCS1jLCAtLWN1dAo+ICsJCWN1dCBwYXR0ZXJuIGZyb20g
ZmlsZQo+ICsJIiIiCj4gKwo+ICsJcHJpbnQoaGVscCkKPiArCXN5cy5leGl0KDApCj4gKwo+ICtk
ZWYgZ2V0X25leHRfYXJnKCk6Cj4gKwlpZiBhcmd2Ogo+ICsJCXJldHVybiBhcmd2LnBvcCgpCj4g
KwllbHNlOgo+ICsJCXByaW50KCJNaXNzaW5nIHBhcmFtZXRlci4gUnVuIHdpdGggXCItLWhlbHBc
IiBmb3IgaW5mb3JtYXRpb24uIikKPiArCQlzeXMuZXhpdCgxKQo+ICsKPiArd2hpbGUgYXJndjoK
PiArCWFyZyA9IGFyZ3YucG9wKCkKPiArCWlmIGFyZyBpbiBbIi1oIiwgIi0taGVscCJdOgo+ICsJ
CXByaW50X2hlbHAoKQo+ICsJZWxpZiBhcmcgaW4gWyItZiIsICItLWZpbGUiXToKPiArCQlzcmNf
ZmlsZV9wYXRoID0gZ2V0X25leHRfYXJnKCkKPiArCWVsaWYgYXJnIGluIFsiLWQiLCAiLS1kZXN0
aW5hdGlvbiJdOgo+ICsJCWRlc3QgPSBnZXRfbmV4dF9hcmcoKQo+ICsJZWxpZiBhcmcgaW4gWyIt
bCIsICItLWxvb2t1cCJdOgo+ICsJCXBlcmltID0gZ2V0X25leHRfYXJnKCkKPiArCWVsaWYgYXJn
IGluIFsiLXMiLCAiLS1zcGxpdCJdOgo+ICsJCWRlbGltID0gZ2V0X25leHRfYXJnKCkKPiArCWVs
aWYgYXJnIGluIFsiLWMiLCAiLS1jdXQiXToKPiArCQlwYXR0ZXJuID0gZ2V0X25leHRfYXJnKCkK
PiArCWVsc2U6Cj4gKwkJcHJpbnQoIklsbGVnYWwgYXJndW1lbnQuIFJ1biB3aXRoIFwiLS1oZWxw
XCIgZm9yIGluZm9ybWF0aW9uLiIpCkknZCBwcmludCBoZWxwIGhlcmUuCj4gKwkJc3lzLmV4aXQo
MSkKPiArCj4gK2lmIG5vdCBzcmNfZmlsZV9wYXRoOgo+ICsJcHJpbnQoIklucHV0IGZpbGUgaGFz
IHRvIGJlIHNwZWNpZmllZC4iKQo+ICsJc3lzLmV4aXQoMSkKPiArCj4gK2lmIG5vdCBkZWxpbSBh
bmQgbm90IHBhdHRlcm4gYW5kIG5vdCBwZXJpbToKPiArCXByaW50KCJNaXNzaW5nIHBhcmFtZXRl
cnMuIFJ1biB3aXRoIFwiLS1oZWxwXCIgZm9yIGluZm9ybWF0aW9uLiIpCj4gKwlzeXMuZXhpdCgx
KQo+ICsKPiArc3JjX2ZpbGUgPSBvcGVuKHNyY19maWxlX3BhdGgsICJyIikKPiArc3JjID0gc3Jj
X2ZpbGUucmVhZCgpCj4gK3NyY19maWxlLmNsb3NlKCkKPiArCj4gK2NhcHR1cmUgPSAwCj4gK2lm
IHBlcmltOgo+ICsJdHJ5Ogo+ICsJCWNhcHR1cmUgPSByZS5zZWFyY2gocGVyaW0sIHNyYykuZ3Jv
dXAoMSkKPiArCWV4Y2VwdDoKPiArCQlwYXNzCj4gKwo+ICtpZiBkZWxpbToKPiArCXNyY19maWxl
X25hbWUgPSBwYXRoLnNwbGl0KHNyY19maWxlX3BhdGgpWzFdCj4gKwlvdXRfZGlyID0gZGVzdCAr
ICIvIiArIHNyY19maWxlX25hbWUgKyAiX291dCIKPiArCj4gKwlpZiBub3QgcGF0aC5leGlzdHMo
b3V0X2Rpcik6Cj4gKwkJbWFrZWRpcnMob3V0X2RpcikKPiArCj4gKwlzcmMgPSByZS5zcGxpdChk
ZWxpbSwgc3JjKQo+ICtlbHNlOgo+ICsJc3JjID0gW3NyY10KPiArCj4gK2lmIHBhdHRlcm46Cj4g
Kwlmb3IgaSBpbiByYW5nZShsZW4oc3JjKSk6Cj4gKwkJc3JjW2ldID0gcmUuc3ViKHBhdHRlcm4s
ICIiLCBzcmNbaV0pCj4gK2lmIGRlbGltIG9yIHBhdHRlcm46Cj4gKwlmb3IgaSBpbiByYW5nZShs
ZW4oc3JjKSk6Cj4gKwkJb3V0X2ZpbGUgPSBvcGVuKG91dF9kaXIgKyAiL291dC4iICsgc3RyKGkp
LCAidyIpCj4gKwkJb3V0X2ZpbGUud3JpdGUoc3JjW2ldKQo+ICsJCW91dF9maWxlLmNsb3NlKCkK
PiArCj4gK3N5cy5leGl0KGNhcHR1cmUpCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
