Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE80F6F65
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 09:05:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A03383C183D
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 09:05:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 001453C176C
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 09:05:46 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 3848F1000D88
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 09:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573459544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I97qEvwu2AGIh2L+Z4KuH4DoAnc+4Mz0VfwDgpyxVJY=;
 b=AeVfBfbc3AZ1TPDxCp1mMaS5GwzmbchxbtCKvsM/TdX+DNIFYnYYr0mWGMakauA1WlxYqm
 Mh7MtVmgqAekmFrLiI9+NYRVCNnLRPH7dFqoyvkCCEzibQ0Vr+atf3aFrPiPpfZxEiroaD
 MjHBZALuYfV9fyOS1vr0d14McM2yr2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-mbh_s45GN8e-a-Q6qNAZVQ-1; Mon, 11 Nov 2019 03:05:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33016801E65
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 08:05:42 +0000 (UTC)
Received: from [172.54.37.191] (cpt-1013.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29FBE5D6A3;
 Mon, 11 Nov 2019 08:05:36 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: 
Date: Mon, 11 Nov 2019 08:05:36 -0000
Message-ID: <cki.ECB352932E.9FL0Q68EC2@redhat.com>
X-Gitlab-Pipeline-ID: 277487
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/cki-pipeline/pipelines/277487
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: mbh_s45GN8e-a-Q6qNAZVQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc6-dd89262=2Ecki_=28mainline=2Ekernel=2Eorg=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Milos Malik <mmalik@redhat.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhlbGxvLAoKV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0
aGlzIGtlcm5lbCB0cmVlOgoKICAgICAgIEtlcm5lbCByZXBvOiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQKICAgICAgICAg
ICAgQ29tbWl0OiBkZDg5MjYyNWQwZTIgLSBNZXJnZSB0YWcgJ3N0YWdpbmctNS40LXJjNycgb2Yg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC9zdGFn
aW5nCgpUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJl
bG93LgoKICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQogICAg
ICAgICAgICAgTWVyZ2U6IE9LCiAgICAgICAgICAgQ29tcGlsZTogT0sKICAgICAgICAgICAgIFRl
c3RzOiBGQUlMRUQKCkFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3Mg
YXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQgaGVyZToKCiAgaHR0cHM6Ly9hcnRpZmFjdHMuY2tp
LXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNzc0ODcKCk9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBm
YWlsZWQ6CgogICAgeDg2XzY0OgogICAgIOKdjCBzZWxpbnV4LXBvbGljeTogc2VyZ2UtdGVzdHN1
aXRlCiAgICAg4p2MIExUUCBsaXRlCgpXZSBob3BlIHRoYXQgdGhlc2UgbG9ncyBjYW4gaGVscCB5
b3UgZmluZCB0aGUgcHJvYmxlbSBxdWlja2x5LiBGb3IgdGhlIGZ1bGwKZGV0YWlsIG9uIG91ciB0
ZXN0aW5nIHByb2NlZHVyZXMsIHBsZWFzZSBzY3JvbGwgdG8gdGhlIGJvdHRvbSBvZiB0aGlzIG1l
c3NhZ2UuCgpQbGVhc2UgcmVwbHkgdG8gdGhpcyBlbWFpbCBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rp
b25zIGFib3V0IHRoZSB0ZXN0cyB0aGF0IHdlCnJhbiBvciBpZiB5b3UgaGF2ZSBhbnkgc3VnZ2Vz
dGlvbnMgb24gaG93IHRvIG1ha2UgZnV0dXJlIHRlc3RzIG1vcmUgZWZmZWN0aXZlLgoKICAgICAg
ICAsLS4gICAsLS4KICAgICAgICggQyApICggSyApICBDb250aW51b3VzCiAgICAgICAgYC0nLC0u
YC0nICAgS2VybmVsCiAgICAgICAgICAoIEkgKSAgICAgSW50ZWdyYXRpb24KICAgICAgICAgICBg
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCgpDb21waWxlIHRlc3RpbmcKLS0tLS0tLS0tLS0tLS0t
CgpXZSBjb21waWxlZCB0aGUga2VybmVsIGZvciAxIGFyY2hpdGVjdHVyZToKCiAgICB4ODZfNjQ6
CiAgICAgIG1ha2Ugb3B0aW9uczogLWozMCBJTlNUQUxMX01PRF9TVFJJUD0xIHRhcmd6LXBrZwoK
CkhhcmR3YXJlIHRlc3RpbmcKLS0tLS0tLS0tLS0tLS0tLQpXZSBib290ZWQgZWFjaCBrZXJuZWwg
YW5kIHJhbiB0aGUgZm9sbG93aW5nIHRlc3RzOgoKICB4ODZfNjQ6CiAgICBIb3N0IDE6CgogICAg
ICAg4pqhIEludGVybmFsIGluZnJhc3RydWN0dXJlIGlzc3VlcyBwcmV2ZW50ZWQgb25lIG9yIG1v
cmUgdGVzdHMgKG1hcmtlZAogICAgICAgd2l0aCDimqHimqHimqEpIGZyb20gcnVubmluZyBvbiB0
aGlzIGFyY2hpdGVjdHVyZS4KICAgICAgIFRoaXMgaXMgbm90IHRoZSBmYXVsdCBvZiB0aGUga2Vy
bmVsIHRoYXQgd2FzIHRlc3RlZC4KCiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgeGZz
dGVzdHM6IGV4dDQKICAgICAgIOKchSB4ZnN0ZXN0czogeGZzCiAgICAgICDinYwgc2VsaW51eC1w
b2xpY3k6IHNlcmdlLXRlc3RzdWl0ZQogICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAgICAg
IOKchSBzdG9yYWdlOiBzb2Z0d2FyZSBSQUlEIHRlc3RpbmcKICAgICAgIPCfmqcg4pyFIElPTU1V
IGJvb3QgdGVzdAogICAgICAg8J+apyDimqHimqHimqEgU3RvcmFnZSBibGt0ZXN0cwoKICAgIEhv
c3QgMjoKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIPCfmqcg4pyFIElQTUkgZHJpdmVyIHRl
c3QKICAgICAgIPCfmqcg4pyFIElQTUl0b29sIGxvb3Agc3RyZXNzIHRlc3QKCiAgICBIb3N0IDM6
CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlv
biB0ZXN0IChhcyByb290KQogICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdyYXRpb24gdGVz
dCAoYXMgdXNlcikKICAgICAgIOKdjCBMVFAgbGl0ZQogICAgICAg4pyFIExvb3BkZXYgU2FuaXR5
CiAgICAgICDinIUganZtIHRlc3Qgc3VpdGUKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1l
bWZkX2NyZWF0ZQogICAgICAg4pyFIE1lbW9yeSBmdW5jdGlvbjoga2FzbHIKICAgICAgIOKchSBB
TVRVIChBYnN0cmFjdCBNYWNoaW5lIFRlc3QgVXRpbGl0eSkKICAgICAgIOKchSBMVFA6IG9wZW5w
b3NpeCB0ZXN0IHN1aXRlCiAgICAgICDinIUgTmV0d29ya2luZyBicmlkZ2U6IHNhbml0eQogICAg
ICAg4pyFIEV0aGVybmV0IGRyaXZlcnMgc2FuaXR5CiAgICAgICDinIUgTmV0d29ya2luZyBNQUNz
ZWM6IHNhbml0eQogICAgICAg4pyFIE5ldHdvcmtpbmcgc29ja2V0OiBmdXp6CiAgICAgICDinIUg
TmV0d29ya2luZyBzY3RwLWF1dGg6IHNvY2tvcHRzIHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5n
OiBpZ21wIGNvbmZvcm1hbmNlIHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlOiBwbXR1
CiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZV9mdW5jOiBsb2NhbAogICAgICAg4pyFIE5ldHdv
cmtpbmcgcm91dGVfZnVuYzogZm9yd2FyZAogICAgICAg4pyFIE5ldHdvcmtpbmcgVENQOiBrZWVw
YWxpdmUgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmcgVURQOiBzb2NrZXQKICAgICAgIOKchSBO
ZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJhc2ljIHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5n
IHR1bm5lbDogZ3JlIGJhc2ljCiAgICAgICDinIUgTDJUUCBiYXNpYyB0ZXN0CiAgICAgICDinIUg
TmV0d29ya2luZyB0dW5uZWw6IHZ4bGFuIGJhc2ljCiAgICAgICDinIUgTmV0d29ya2luZyBpcHNl
YzogYmFzaWMgbmV0bnMgdHJhbnNwb3J0CiAgICAgICDinIUgTmV0d29ya2luZyBpcHNlYzogYmFz
aWMgbmV0bnMgdHVubmVsCiAgICAgICDinIUgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0ZXN0CiAg
ICAgICDinIUgaHR0cGQ6IG1vZF9zc2wgc21va2Ugc2FuaXR5CiAgICAgICDinIUgaW90b3A6IHNh
bml0eQogICAgICAg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdoLXBlcmYKICAgICAg
IOKchSBwY2l1dGlsczogc2FuaXR5IHNtb2tlIHRlc3QKICAgICAgIOKchSBBTFNBIFBDTSBsb29w
YmFjayB0ZXN0CiAgICAgICDinIUgQUxTQSBDb250cm9sIChtaXhlcikgVXNlcnNwYWNlIEVsZW1l
bnQgdGVzdAogICAgICAg4pyFIFVzZXggLSB2ZXJzaW9uIDEuOS0yOQogICAgICAg4pyFIHN0b3Jh
Z2U6IFNDU0kgVlBECiAgICAgICDinIUgc3RyZXNzOiBzdHJlc3MtbmcKICAgICAgIOKchSB0cmFj
ZTogZnRyYWNlL3RyYWNlcgogICAgICAg8J+apyDinIUgQ0lGUyBDb25uZWN0YXRob24KICAgICAg
IPCfmqcg4pyFIFBPU0lYIHBqZC1mc3Rlc3Qgc3VpdGVzCiAgICAgICDwn5qnIOKchSBOZXR3b3Jr
aW5nIHZuaWM6IGlwdmxhbi9iYXNpYwogICAgICAg8J+apyDinIUgc3RvcmFnZTogZG0vY29tbW9u
CgogIFRlc3Qgc291cmNlczogaHR0cHM6Ly9naXRodWIuY29tL0NLSS1wcm9qZWN0L3Rlc3RzLWJl
YWtlcgogICAg8J+SmiBQdWxsIHJlcXVlc3RzIGFyZSB3ZWxjb21lIGZvciBuZXcgdGVzdHMgb3Ig
aW1wcm92ZW1lbnRzIHRvIGV4aXN0aW5nIHRlc3RzIQoKV2FpdmVkIHRlc3RzCi0tLS0tLS0tLS0t
LQpJZiB0aGUgdGVzdCBydW4gaW5jbHVkZWQgd2FpdmVkIHRlc3RzLCB0aGV5IGFyZSBtYXJrZWQg
d2l0aCDwn5qnLiBTdWNoIHRlc3RzIGFyZQpleGVjdXRlZCBidXQgdGhlaXIgcmVzdWx0cyBhcmUg
bm90IHRha2VuIGludG8gYWNjb3VudC4gVGVzdHMgYXJlIHdhaXZlZCB3aGVuCnRoZWlyIHJlc3Vs
dHMgYXJlIG5vdCByZWxpYWJsZSBlbm91Z2gsIGUuZy4gd2hlbiB0aGV5J3JlIGp1c3QgaW50cm9k
dWNlZCBvciBhcmUKYmVpbmcgZml4ZWQuCgpUZXN0aW5nIHRpbWVvdXQKLS0tLS0tLS0tLS0tLS0t
CldlIGFpbSB0byBwcm92aWRlIGEgcmVwb3J0IHdpdGhpbiByZWFzb25hYmxlIHRpbWVmcmFtZS4g
VGVzdHMgdGhhdCBoYXZlbid0CmZpbmlzaGVkIHJ1bm5pbmcgYXJlIG1hcmtlZCB3aXRoIOKPsS4g
UmVwb3J0cyBmb3Igbm9uLXVwc3RyZWFtIGtlcm5lbHMgaGF2ZQphIEJlYWtlciByZWNpcGUgbGlu
a2VkIHRvIG5leHQgdG8gZWFjaCBob3N0LgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
