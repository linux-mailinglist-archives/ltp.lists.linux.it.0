Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5342F639A
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 16:02:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31D673C6A67
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 16:02:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0EE2F3C2656
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 16:02:17 +0100 (CET)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 10FFC1A0106A
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 16:01:46 +0100 (CET)
Received: by mail-pg1-x529.google.com with SMTP id i5so3971443pgo.1
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:subject:date:from:to;
 bh=iPye7hvXXk1IMOn3C/Nf+vQu3Gh6Yj68b+udkr7vyG4=;
 b=idIKZ2hYw2NUYWXyiWkZHUz2iS3zPEb7WXX69nqUlM/zVfiynfQYO8MVLB8OFtgwzV
 qOZWr5tQxRy59fZdsWuBJrcCjcZEObgNU6yeXu/mb6DAaO1v7IKVe0LNa6yisOBdtkSt
 nxexbTQbg1gTfNytjCurTmYJYFSoGFg+8QLpY3V6vvHU8ENyTaHSxz8lExz61qghdKaR
 DNC9HQ2Q/eF9nDf5MVcqetBLLCDS2BzbrQOZtz2lKTI1FxhnlB9AiLfU6R172UGok4hn
 EkZ20w0JUy2El5nu08Ntjuc3gczU/zDVljT3e+xgyFLH3xBsq72ln8aoWtiLfiM0DxfF
 2+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:subject:date:from:to;
 bh=iPye7hvXXk1IMOn3C/Nf+vQu3Gh6Yj68b+udkr7vyG4=;
 b=RdEY1n3lWAnvN7dvkyfOm0rVkJ1Xetw0kFbe0njkUQxyCvo1vxL8817bKW9IE5+XSy
 A7YnR1aTKirZZ83oJmL9aR8ZWzVwo2GbJ9GwEf037DZ4PPnZ/PGIEY6JuTnmKNAPRmnI
 qv0sQyL+4U0SFWQAI+T9eepU1EcPeajZ7bOP1ZAwwNszqtRQ6PC9pDfq4img0Q8OdXeW
 D3Z9pQbGo8Mbbycl362AD4772n8/1Nc0OodoyitDaPeLA2KkJGyvWYaUhhKzdOc4PJSb
 Qxv10B03ObQ2aBch+NxTZWLlw3mYSWdofaP7/LtS+btaa+CSJAqZPEiDeFwE4GyDqXdb
 eOUg==
X-Gm-Message-State: AOAM530EI27Nqi9kyv4pAtQnZuy6YGFrJtaxVPzjByZAPO413KMcTH+1
 MV57Tiu8fnghGv2tWEoD35Q=
X-Google-Smtp-Source: ABdhPJx+VaxzsCl+N3w2a4/y4wz2ujU1sF429YL8hcNtzIp4l6KOup+s2PPJHnHbbwPwxCugH9gfZA==
X-Received: by 2002:a62:5844:0:b029:1a8:b9dc:77bf with SMTP id
 m65-20020a6258440000b02901a8b9dc77bfmr7679341pfb.39.1610636504415; 
 Thu, 14 Jan 2021 07:01:44 -0800 (PST)
Received: from localhost ([203.205.219.184])
 by smtp.gmail.com with ESMTPSA id t135sm5266311pfc.39.2021.01.14.07.01.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:01:43 -0800 (PST)
Message-ID: <60005cd7.1c69fb81.d830f.d248@mx.google.com>
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Date: Thu, 14 Jan 2021 23:01:40 +0800 (GMT+08:00)
From: =?UTF-8?B?Z2VuZ2NpeGlAZ21haWwuY29t?=<gengcixi@gmail.com>
To: =?UTF-8?B?Q3lyaWwgSHJ1Ymlz?=<chrubis@suse.cz>,
 =?UTF-8?B??=<ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=5.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Holidays and LTP release
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
Content-Type: multipart/mixed; boundary="===============0833924719=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0833924719==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_190788855.1610636501492"

------=_Part_0_190788855.1610636501492
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_190788855.1610636501492
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: base64

PGRpdj48YnI+PC9kaXY+PGRpdj4mZ3Q7SGkhPGJyPiZndDtBcyZuYnNwO0kmbmJzcDthbm91bmNl
ZCZuYnNwO2xhc3QmbmJzcDt3ZWVrJm5ic3A7cGxlYXNlJm5ic3A7Y29uc2lkZXImbmJzcDtnaXQm
bmJzcDtmcm96ZW4mbmJzcDtmb3ImbmJzcDthbnl0aGluZyZuYnNwO2J1dDxicj4mZ3Q7aW1wb3J0
YW50Jm5ic3A7Zml4ZXMmbmJzcDtub3cuPGJyPiZndDs8YnI+Jmd0O0Fsc28mbmJzcDtpZiZuYnNw
O3lvdSZuYnNwO2hhdmVuJ3QmbmJzcDtkb25lJm5ic3A7c28mbmJzcDt5ZXQsJm5ic3A7cGxlYXNl
Jm5ic3A7dGVzdCZuYnNwO2xhdGVzdCZuYnNwO2dpdCZuYnNwO2hlYWQmbmJzcDtub3cmbmJzcDth
bmQ8YnI+Jmd0O3JlcG9ydCZuYnNwO2FueSZuYnNwO3Byb2JsZW1zJm5ic3A7eW91Jm5ic3A7Zmlu
ZC48YnI+PGJyPiZndDstLSZuYnNwOzxicj4mZ3Q7Q3lyaWwmbmJzcDtIcnViaXM8YnI+Jmd0O2No
cnViaXNAc3VzZS5jejxicj48YnI+Jmd0Oy0tJm5ic3A7PGJyPiZndDtNYWlsaW5nJm5ic3A7bGlz
dCZuYnNwO2luZm86Jm5ic3A7aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHA8YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5jYW4gd2UgbWVyZ2UgdGhlIHJ0YzAyIGNhc2UgaW4g
dGhlIG5ldyByZWxlYXNlPzwvZGl2PjxkaXY+PGJyPjwvZGl2Pg==
------=_Part_0_190788855.1610636501492--

--===============0833924719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0833924719==--
