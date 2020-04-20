Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2C1B0C2D
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 15:01:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5A733C2A28
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 15:01:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C8E5B3C2A13
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 15:01:40 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2FA3D600FD9
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 15:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=mOvuf
 FVnlhAFWdAyl1Kb1tikwyuKZB7+zmcsRlzrQwM=; b=DVz22JOl4a3ILIRJ8ioSZ
 Sdz2ecO0jnxAdTBc0LMBayT2iYxzgxzjvcjWEbkP1si/kdJbTRiaW14qz1J98qZF
 hnpHXRt8jTUuuFhwRMi6jgUN/og7/a3jv58JymmunK8BZ2gCG138R8zeWn2FMwHy
 jK1D+On8SSamRtdt4UD1f0=
Received: from localhost (unknown [223.104.145.11])
 by smtp9 (Coremail) with SMTP id DcCowADn7FwunZ1eS4swAw--.362S2;
 Mon, 20 Apr 2020 21:01:35 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Mon, 20 Apr 2020 21:01:32 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?Q3lyaWwgSHJ1Ymlz?=<chrubis@suse.cz>,
 =?UTF-8?B?WWFuZyBYdQ==?=<xuyang2018.jy@cn.fujitsu.com>
X-CM-TRANSID: DcCowADn7FwunZ1eS4swAw--.362S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWUuF4DZFWxXrWrZryxZrb_yoWkJFcEvF
 y8Ary8J3y8CF4Igw43Arsak343Cr4UA34rGr93Wa1qk34Utrs7Xr1kArZavayUW3W5Cw43
 KFZ5XryIvw13XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnYhF7UUUUU==
X-Originating-IP: [223.104.145.11]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiyg8MhFQHH-94SgAAsM
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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
Cc: =?UTF-8?B??= <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0857727250=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0857727250==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_170651296.1587387693574"

------=_Part_0_170651296.1587387693574
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_170651296.1587387693574
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: base64

PGRpdj5IaSBDeXJpbDwvZGl2PjxkaXY+cHJjdGwwNy5jIHRlc3RzIGFtYmllbnQgY2FwYWJpbGl0
eS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QgUmVnYXJkczwvZGl2PjxkaXY+WWFuZyBY
dTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PCEtLWVtcHR5c2lnbi0tPjwvZGl2PjxkaXY+PGRp
diBzdHlsZT0iZm9udC1zaXplOjEycHg7cGFkZGluZzoycHggMDsiPi0tLU9yaWdpbmFsLS0tPC9k
aXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEycHg7YmFja2dyb3VuZDojZjBmMGYwO2NvbG9yOiMy
MTIxMjE7cGFkZGluZzo4cHghaW1wb3J0YW50O2JvcmRlci1yYWRpdXM6NHB4O2xpbmUtaGVpZ2h0
OjEuNTsiPjxkaXY+PGI+RnJvbTo8L2I+ICJDeXJpbCBIcnViaXMiJmx0O2NocnViaXNAc3VzZS5j
eiZndDs8L2Rpdj48ZGl2PjxiPkRhdGU6PC9iPiBNb24sIEFwciAyMCwgMjAyMCAyMDo1NSBQTTwv
ZGl2PjxkaXY+PGI+VG86PC9iPiAiWWFuZyBYdSImbHQ7eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1
LmNvbSZndDs7PC9kaXY+PGRpdj48Yj5DYzo8L2I+ICJsdHAiJmx0O2x0cEBsaXN0cy5saW51eC5p
dCZndDs7PC9kaXY+PGRpdj48Yj5TdWJqZWN0OjwvYj4gUmU6IFtMVFBdIFtQQVRDSCB2MiAwMi8x
MF0gc3lzY2FsbHMvaW9jdGw6YWRkIGNvbW1vbiBjIGZpbGUgZm9yIGxvb3AgaW9jdGw8L2Rpdj48
L2Rpdj48YnI+SGkhPGJyPiZndDsmbmJzcDsmZ3Q7Jm5ic3A7SW4mbmJzcDt0aGUmbmJzcDtlbmQm
bmJzcDtJJ3ZlJm5ic3A7cmVuYW1lZCZuYnNwO2FuZCZuYnNwO21vdmVkJm5ic3A7dGhlc2UmbmJz
cDtmdW5jdGlvbnMmbmJzcDtpbnRvJm5ic3A7dGhlJm5ic3A7dGVzdCZuYnNwO2xpYnJhcnk8YnI+
Jmd0OyZuYnNwOyZndDsmbmJzcDtiZWNhdXNlJm5ic3A7dGhlJm5ic3A7ZnVuY3Rpb25hbGl0eSZu
YnNwO2lzJm5ic3A7Z2VuZXJpYyZuYnNwO2Vub3VnaCZuYnNwO2FuZCZuYnNwO0kmbmJzcDtkb3Vi
dCZuYnNwO3RoYXQmbmJzcDt0aGVzZTxicj4mZ3Q7Jm5ic3A7Jmd0OyZuYnNwO3Rlc3RzJm5ic3A7
d291bGQmbmJzcDtiZSZuYnNwO3RoZSZuYnNwO29ubHkmbmJzcDtvbmUmbmJzcDt1c2luZyZuYnNw
O2l0Ljxicj4mZ3Q7Jm5ic3A7VGhhdCdzJm5ic3A7Z3JlYXQuJm5ic3A7Jm5ic3A7SSZuYnNwO3Jl
bWVtYmVyJm5ic3A7cHJjdGwmbmJzcDtjYXNlcyZuYnNwO3VzZSZuYnNwO3RoaXMmbmJzcDtmdW5j
dGlvbi4mbmJzcDtBbHNvLCZuYnNwO2luJm5ic3A7c29tZSZuYnNwOzxicj4mZ3Q7Jm5ic3A7Y2Fw
Jm5ic3A7Y2FzZXMsJm5ic3A7aXQmbmJzcDtuZWVkcyZuYnNwO2JpdHdpc2UmbmJzcDtvcGVyYXRv
cnMoSSZuYnNwO29ubHkmbmJzcDtrbm93Jm5ic3A7cHJjdGwwOC5jKS4mbmJzcDtNYXliZSZuYnNw
O3dlJm5ic3A7PGJyPiZndDsmbmJzcDtjYW4mbmJzcDthZGQmbmJzcDtUU1RfQVNTRVJUX0JJVFdJ
U0U/PGJyPjxicj5JJm5ic3A7Z3Vlc3MmbmJzcDt0aGF0Jm5ic3A7d2UmbmJzcDt3b3VsZCZuYnNw
O25lZWQmbmJzcDt0byZuYnNwO3Bhc3MmbmJzcDt0byZuYnNwO251bWJlcnMmbmJzcDt0byZuYnNw
O3RoZSZuYnNwO2JpdHdpc2UmbmJzcDtvcGVyYXRpb24sPGJyPm9uZSZuYnNwO3dvdWxkJm5ic3A7
YmUmbmJzcDttYXNrJm5ic3A7Zm9yJm5ic3A7d2hpY2gmbmJzcDtiaXRzJm5ic3A7c2hvdWxkJm5i
c3A7YmUmbmJzcDt1c2VkJm5ic3A7Zm9yJm5ic3A7dGhlJm5ic3A7Y29tcGFyc2lvbiZuYnNwO2Fu
ZDxicj5vbmUmbmJzcDt3aXRoJm5ic3A7dGhlJm5ic3A7YWN0dWFsJm5ic3A7Yml0cy4mbmJzcDtX
aGljaCZuYnNwO3Rlc3RzJm5ic3A7d291bGQmbmJzcDtuZWVkJm5ic3A7dGhhdD8mbmJzcDtJJm5i
c3A7bG9va2VkJm5ic3A7YXQ8YnI+Y2Fwc2V0Jm5ic3A7YW5kJm5ic3A7Y2FwZ2V0Jm5ic3A7dGVz
dHMmbmJzcDtidXQmbmJzcDt0aGVyZSZuYnNwO2RvZXMmbmJzcDtub3QmbmJzcDtzZWVtJm5ic3A7
dG8mbmJzcDthbnkmbmJzcDtiaXR3aXNlJm5ic3A7Y2hlY2tzJm5ic3A7b248YnI+dmFsdWVzJm5i
c3A7b24mbmJzcDtwcm9jJm5ic3A7b3ImbmJzcDtzeXMmbmJzcDtmaWxlcy48YnI+PGJyPi0tJm5i
c3A7PGJyPkN5cmlsJm5ic3A7SHJ1YmlzPGJyPmNocnViaXNAc3VzZS5jejxicj48YnI+LS0mbmJz
cDs8YnI+TWFpbGluZyZuYnNwO2xpc3QmbmJzcDtpbmZvOiZuYnNwO2h0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwPGJyPjwvZGl2Pg==
------=_Part_0_170651296.1587387693574--


--===============0857727250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0857727250==--

