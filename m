Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A342B435FB6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Oct 2021 12:51:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 639FC3C566E
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Oct 2021 12:51:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7CFF93C55BB
 for <ltp@lists.linux.it>; Thu, 21 Oct 2021 12:51:38 +0200 (CEST)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.219])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 1849B60080A
 for <ltp@lists.linux.it>; Thu, 21 Oct 2021 12:51:36 +0200 (CEST)
HMM_SOURCE_IP: 172.18.0.48:38552.1457233362
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 28F5128009C;
 Thu, 21 Oct 2021 18:51:29 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 9ec9476c8c904308a8540b7934868a1f for
 krzysztof.kozlowski@canonical.com; Thu, 21 Oct 2021 18:51:32 CST
X-Transaction-ID: 9ec9476c8c904308a8540b7934868a1f
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
Date: Thu, 21 Oct 2021 18:51:30 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, 
 ltp <ltp@lists.linux.it>
References: <20211021083547.111590-1-krzysztof.kozlowski@canonical.com>, 
 <20211021083547.111590-2-krzysztof.kozlowski@canonical.com>
X-Priority: 3
X-GUID: 991203F7-8145-4A1E-8740-5EF79B178DB8
X-Has-Attach: no
X-Mailer: Foxmail 7.2.20.258[cn]
Mime-Version: 1.0
Message-ID: <2021102118513035980214@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=MIME_BASE64_TEXT,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] lib: memutils: include also available
 memory when polluting
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

Good solution,thanks.

Reviewed-by: Liu Xinpeng <liuxp11@chinatelecom.cn>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
