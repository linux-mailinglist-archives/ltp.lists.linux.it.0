Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2A36308
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 19:55:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA37E3EA69B
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 19:55:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1EB063EA360
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 19:55:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CE8561A00E40
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 19:55:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CEA78AAA8;
 Wed,  5 Jun 2019 17:55:21 +0000 (UTC)
Date: Wed, 5 Jun 2019 19:55:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yihao Wu <wuyihao@linux.alibaba.com>
Message-ID: <20190605175522.GA3188@dell5510>
References: <3e2f5f1b-3fb8-8c16-5c04-383221c175ed@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e2f5f1b-3fb8-8c16-5c04-383221c175ed@linux.alibaba.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: shanpeic@linux.alibaba.com,
 =?utf-8?B?6KeJ5bCP?= <juexiao.sxh@linux.alibaba.com>, ltp@lists.linux.it,
 caspar@linux.alibaba.com
Subject: Re: [LTP] [PATCH] commands: add test for chrt
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWloYW8sCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2guCgpGaXJzdCBxdWVzdGlvbjogc2hvdWxk
bid0IHRoaXMgdGVzdCBnbyB0byB1cHN0cmVhbSwgaS5lLiBsaWJjZyBbMV0/CgpCVFcgdGhlcmUg
YXJlIGNncm91cCByZWxhdGVkIHRlc3RzIHdoaWNoIG5lZWRzIHRvIGdldCB1cGRhdGVkIGFuZCBy
ZXdyaXR0ZW4gdG8KbmV3IEFQSSAodGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jZ3JvdXAq
LykuCgo+IFRoaXMgdGVzdCBjaGVja3MgY2hlY2sgd2hldGhlciBjaHJ0IHdvcmtzIHByb3Blcmx5
CgouLi4KPiArKysgYi90ZXN0Y2FzZXMvY29tbWFuZHMvY2hydC9NYWtlZmlsZQo+IEBAIC0wLDAg
KzEsMjEgQEAKPiArIwo+ICsjIENvcHlyaWdodCAoYykgMjAxOSBBbGliYWJhIEluYwo+ICsjIEF1
dGhvcjogWWloYW8gV3UgPHd1eWloYW9AbGludXguYWxpYmFiYS5jb20+Cgo+ICsjCj4gKyMgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
ciBtb2RpZnkKPiArIyBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+ICsjIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4gKyMgKGF0IHlvdXIgb3B0
aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPiArIwo+ICsjIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmli
dXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+ICsjIGJ1dCBXSVRIT1VU
IEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gKyMg
TUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiBTZWUK
PiArIyB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KUmVt
b3ZlIHRoaXMgR05VIGxpY2Vuc2UgdGV4dCBhbmQgdXNlIGp1c3QKIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgoKLi4uCj4gKysrIGIvdGVzdGNhc2VzL2NvbW1hbmRz
L2NocnQvY2hydDAxLnNoCj4gQEAgLTAsMCArMSw1MiBAQAo+ICsjIS9iaW4vc2gKPiArIyBDb3B5
cmlnaHQgKGMpIDIwMTkgQWxpYmFiYSBJbmMKPiArIyBBdXRob3I6IFlpaGFvIFd1IDx3dXlpaGFv
QGxpbnV4LmFsaWJhYmEuY29tPgo+ICsjCj4gKyMgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPiArIyBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBi
eQo+ICsjIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2Yg
dGhlIExpY2Vuc2UsIG9yCj4gKyMgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4K
PiArIwo+ICsjIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLAo+ICsjIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBl
dmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gKyMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiBTZWUKPiArIyB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KVGhlIHNhbWUgaGVyZS4KCj4gKyMKPiArIyBU
ZXN0IHRoZSBiYXNpYyBmdW5jdGlvbmFsaXR5IG9mIGNocnQgY29tbWFuZC4KPiArIwo+ICtUU1Rf
VEVTVEZVTkM9Y2hydF90ZXN0Cj4gK1RTVF9TRVRVUD1zZXR1cAo+ICtUU1RfQ0xFQU5VUD1jbGVh
bnVwCj4gK1RTVF9ORUVEU19DTURTPSJjaHJ0IGNnZXhlYyBjZ3NldCBjZ2dldCIKPiArVFNUX05F
RURTX1JPT1Q9MQo+ICsuIHRzdF90ZXN0LnNoCj4gKwo+ICtzZXR1cCgpCj4gK3sKPiArCW9sZF9y
dF9ydW50aW1lX3VzPSQoY2dnZXQgLXIgY3B1LnJ0X3J1bnRpbWVfdXMgLyAtdm4pCj4gKwlvbGRf
cnRfcGVyaW9kX3VzPSQoY2dnZXQgLXIgY3B1LnJ0X3BlcmlvZF91cyAvIC12bikKPiArCj4gKwlj
Z3NldCAtciBjcHUucnRfcnVudGltZV91cz0xMDAwMCAvCj4gKwljZ3NldCAtciBjcHUucnRfcGVy
aW9kX3VzPTEwMDAwMDAgLwo+ICt9Cj4gKwo+ICtjaHJ0X3Rlc3QoKQo+ICt7Cj4gKwljZ2V4ZWMg
LWcgY3B1Oi8gLWcgY3B1c2V0Oi8gc2xlZXAgNCAmCj4gKwlQSUQ9JCEKPiArCWNnZXhlYyAtZyBj
cHU6LyAtZyBjcHVzZXQ6LyBjaHJ0IC1hcnAgNTAgJHtQSUR9Cj4gKwlTQ0hFRFVMRVI9JChjaHJ0
IC1wICR7UElEfSB8IGF3ayAnTlI9PTF7cHJpbnQgJDZ9JykKPiArCWlmIFsgeCIke1NDSEVEVUxF
Un0iID09IHgiU0NIRURfUlIiIF07IHRoZW4KU29tZSBiYXNpYyBydWxlcyBmb3Igc2hlbGwgdGVz
dHMgWzJdIGFyZSB0byBjaGVjayBjb2RlIG9uIGNoZWNrYmFzaGlzbS5wbCBzY3JpcHQgb3IKb24g
L2Jpbi9zaCBsaW5rZWQgYXMgZGFzaC4KPT4gaWYgWyAiJHNjaGVkdWxlciIgID0gIiRzY2hlZF9y
ciIgXTsgdGhlbgoKPiArCQl0c3RfcmVzIFRQQVNTICInY2hydCcgcGFzc2VkLiIKPiArCWVsc2UK
PiArCQl0c3RfcmVzIFRGQUlMICInY2hydCcgZmFpbGVkIHRvIHNldCBzY2hlZHVsaW5nIHBvbGlj
eS4iCj4gKwlmaQo+ICt9CgpUaGVuLCB1c2luZyBsb2NhbCBmb3IgbG9jYWwgdmFyaWFibGVzIGFu
ZCBsb3dlciBjYXNlIGZvciBsb2NhbCB2YXJpYWJsZXMKKHByZWZlcmFibHkgYWxzbyBmb3IgZ2xv
YmFsIHZhcmlhYmxlcywgdXBwZXIgY2FzZSBhcmUgdXN1YWxseSB2YXJpYWJsZXMgZnJvbQpzaGVs
bCBsaWJyYXJpZXMpID0+CmxvY2FsIHBpZApsb2NhbCBzY2hlZHVsZXIKCj4gKwo+ICtjbGVhbnVw
KCkKPiArewo+ICsJY2dzZXQgLXIgY3B1LnJ0X3J1bnRpbWVfdXM9JHtvbGRfcnRfcnVudGltZV91
c30gLwo+ICsJY2dzZXQgLXIgY3B1LnJ0X3BlcmlvZF91cz0ke29sZF9ydF9wZXJpb2RfdXN9IC8K
SSBnZXQKY2dzZXQ6IHdyb25nIHBhcmFtZXRlciBvZiBvcHRpb24gLXI6IGNwdS5ydF9ydW50aW1l
X3VzCmNnc2V0OiB3cm9uZyBwYXJhbWV0ZXIgb2Ygb3B0aW9uIC1yOiBjcHUucnRfcGVyaW9kX3Vz
CgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gK30KPiArCj4gK3RzdF9ydW4KClsxXSBodHRwOi8vbGli
Y2cuc291cmNlZm9yZ2UubmV0LwpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJv
amVjdC9sdHAvd2lraS9UZXN0LVdyaXRpbmctR3VpZGVsaW5lcyMyMy13cml0aW5nLWEtdGVzdGNh
c2UtaW4tc2hlbGwKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
