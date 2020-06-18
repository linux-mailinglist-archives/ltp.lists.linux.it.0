Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E92A1FEFDA
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 12:47:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 294AD3C2CE3
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 12:47:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9D19C3C2C74
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 08:16:09 +0200 (CEST)
Received: from mail.zilogic.com (mail.zilogic.com [45.33.14.236])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9B4331A00895
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 08:16:08 +0200 (CEST)
Date: Thu, 18 Jun 2020 06:15:03 -0000
To: ltp@lists.linux.it
Message-ID: <c6792053-287d-7a53-477d-5f5ad95ffa6f@zilogic.com>
From: "Pravin Raghul" <pravinraghul@zilogic.com>
Received: from [192.168.43.109] (157.50.211.105 [157.50.211.105])
 by mail.zilogic.com; Thu, 18 Jun 2020 06:15:11 -0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 18 Jun 2020 12:46:52 +0200
Subject: [LTP] Testcase approach for MAP_GROWSDOWN
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
Content-Type: multipart/mixed; boundary="===============1413936354=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


This is a multi-part message in MIME format.
--===============1413936354==
Content-Type: multipart/alternative;
 boundary="------------45F1D91F499322C0C0043F45"
Content-Language: en-US


This is a multi-part message in MIME format.
--------------45F1D91F499322C0C0043F45
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

We are planning to add the following testcases for MAP_GROWSDOWN, please 
let us know your thoughts on this.

We assign the memory region allocated using MAP_GROWSDOWN to a thread, 
as a stack, to test the effect of MAP_GROWSDOWN. This is because the 
kernel only grows the memory region when the stack pointer, is within 
guard page, when the guard page is touched.


      Test Case 1: Grow into an unmapped region

 1. Map an anyonymous memory region of size X, and unmap it.
 2. Split the unmapped memory region into two.
 3. The lower memory region is left unmapped.
 4. The higher memory region is mapped for use as stack, using MAP_FIXED
    | MAP_GROWSDOWN.
 5. The higher memory region is provided as stack to a thread, where a
    recursive function is invoked.
 6. The stack grows beyond the allocated region, into the lower memory area.
 7. If this results in the memory region being extended, into the
    unmapped region, the test is considered to have passed.


      Test Case 2: Grow into a mapped region

 1. Map an anonymous memory area.
 2. Split the memory area into two by mapping them into two areas.
 3. The lower memory area is mapped using MAP_FIXED.
 4. The higher memory area is mapped for use as stack, using MAP_FIXED |
    MAP_GROWSDOWN.
 5. The higher memory area is provided as stack to a thread, where a
    recursive function is invoked.
 6. The stack grows beyond the allocated area, into the lower memory area.
 7. If this results in a segmentation fault, the test is considered to
    have passed.


--------------45F1D91F499322C0C0043F45
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>We are planning to add the following testcases for MAP_GROWSDOWN,
      please let us know your thoughts on this.</p>
    <p>We assign the memory region allocated using MAP_GROWSDOWN to a
      thread, as a stack, to test the effect of MAP_GROWSDOWN. This is
      because the kernel only grows the memory region when the stack
      pointer, is within guard page, when the guard page is touched.</p>
    <h3>Test Case 1: Grow into an unmapped region</h3>
    <ol>
      <li>Map an anyonymous memory region of size X, and unmap it.</li>
      <li>Split the unmapped memory region into two.</li>
      <li>The lower memory region is left unmapped.</li>
      <li>The higher memory region is mapped for use as stack, using
        MAP_FIXED | MAP_GROWSDOWN.</li>
      <li>The higher memory region is provided as stack to a thread,
        where a recursive function is invoked.</li>
      <li>The stack grows beyond the allocated region, into the lower
        memory area.</li>
      <li>If this results in the memory region being extended, into the
        unmapped region, the test is considered to have passed.</li>
    </ol>
    <h3>Test Case 2: Grow into a mapped region</h3>
    <ol>
      <li>Map an anonymous memory area.</li>
      <li>Split the memory area into two by mapping them into two areas.</li>
      <li>The lower memory area is mapped using MAP_FIXED.</li>
      <li>The higher memory area is mapped for use as stack, using
        MAP_FIXED | MAP_GROWSDOWN.</li>
      <li>The higher memory area is provided as stack to a thread, where
        a recursive function is invoked.</li>
      <li>The stack grows beyond the allocated area, into the lower
        memory area.</li>
      <li>If this results in a segmentation fault, the test is
        considered to have passed.</li>
    </ol>
  </body>
</html>

--------------45F1D91F499322C0C0043F45--

--===============1413936354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1413936354==--
