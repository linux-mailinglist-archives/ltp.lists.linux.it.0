Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14662824A24
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jan 2024 22:17:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9B5E3CE6D7
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jan 2024 22:17:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 542E63CE5CE
 for <ltp@lists.linux.it>; Thu,  4 Jan 2024 22:17:05 +0100 (CET)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8AD5D1A004D5
 for <ltp@lists.linux.it>; Thu,  4 Jan 2024 22:17:05 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-555aa7fd668so1138199a12.0
 for <ltp@lists.linux.it>; Thu, 04 Jan 2024 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704403025; x=1705007825; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QmroFGGHTZeCPR3aq9X7U7TuB9grQfLCgxaeODeAS6A=;
 b=RzEYp3Cj6MofJ1L5+i77RkSLUOOF6Sys2jyjo7Dh7QKTPA6oM+jqZz4Iz95WkzdtE8
 LKW2NOFC6F0l7IpPeArOGfu7bFs8S4VC7NloN5sX4p30xybfgg2bOT1a0Tz6nM5Hh4Qp
 7JfGta9n/yjRR3UIY6qMkC9g9hW4RyhsII7QGD+9oJrlS1ER35SVed6jIsopUFMjmIku
 UGYesdSkhoqRztiiqRw+Z/sdWv9zJRUAtDJGEXH4arCPtzhGQvFlFdeCi+2hDIRNKtq5
 A4rixkwAN5HlfDNQL5ha1lovHP98ghnd5nNt28WpLCBd6Ns/nyox/oqNsVepMoWOiTj3
 IWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704403025; x=1705007825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmroFGGHTZeCPR3aq9X7U7TuB9grQfLCgxaeODeAS6A=;
 b=b41sey9IFp1FiexSdDT8uMTrbq+ybCcrwbE9GJoJIwx91aAQT2eVZkQonsNCxMhMGH
 S5Cg1Hwdfe+Iosd9mfs++KcPJVT/A1f8B3WT5donogt3NpA0Ct1ak579c502pYo2KgSX
 CCU4DJskYoK/cMeDWXoil84vrqmyMuHpy/OTIaDkhnaDKWGuGiXq1DCtflj2rqC0QGJm
 4GDLdhLZy12yig8aiZz4jcxAircu/SWjJLgb+FZ9ecG1WSYqB/oXUDx6VC3+P0mWmiZS
 zs3Wz8mTjFiIm4OElqM6ge/XYgyHkHtRmiVFMzYWyhdqboziFG0qhI/aHYpjOpDzue/v
 Za9w==
X-Gm-Message-State: AOJu0YxqswC939WNAorLvfAbH+o8duid0fP50knTJ7K4BJAshG5o/d6W
 AqP0YfwjrUtdeq9TjvUOalieUXzz7l8S/Q==
X-Google-Smtp-Source: AGHT+IE7whVPqKCAWN3ofSpSIay+fyWTsD5sDNB24jokBZw3QOgw2BVD7X6N8N8wBmgjrbRv5JRE1A==
X-Received: by 2002:a50:c291:0:b0:553:b950:f9d4 with SMTP id
 o17-20020a50c291000000b00553b950f9d4mr549627edf.80.1704403024759; 
 Thu, 04 Jan 2024 13:17:04 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 b23-20020aa7c6d7000000b00555a0fa2211sm150375eds.31.2024.01.04.13.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 13:17:04 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu,  4 Jan 2024 22:16:49 +0100
Message-ID: <20240104211654.1437671-5-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104211654.1437671-1-petr.vorel@gmail.com>
References: <20240104211654.1437671-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 4/9] metadata: test.sh: Print more info on VERBOSE=1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Petr Vorel <pvorel@suse.cz>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 metadata/tests/test.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/metadata/tests/test.sh b/metadata/tests/test.sh
index 475d721df..a00e32bb4 100755
--- a/metadata/tests/test.sh
+++ b/metadata/tests/test.sh
@@ -3,6 +3,7 @@
 fail=0
 
 for i in *.c; do
+	[ "$VERBOSE" ] && echo "$0: testing $i"
 	../metaparse $i > tmp.json
 	if ! diff tmp.json $i.json >/dev/null 2>&1; then
 		echo "***"
@@ -15,4 +16,5 @@ done
 
 rm -f tmp.json
 
+[ "$VERBOSE" ] && echo "$fail"
 exit $fail
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
