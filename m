Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDDE2558FF
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 13:00:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B778C3C2E56
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 13:00:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C20853C25A9
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 12:59:55 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1240A200D53
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 12:59:54 +0200 (CEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SAWjaY109078; Fri, 28 Aug 2020 06:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=UjEwjgQre7DBftpvnsrN+R8Bd55CfmO1UEnvz8w2eII=;
 b=Hv4r/YZprUHzTB7MY9LD9gU/BHO+e22umJWMvG2UffgD86CbRXI1ny+QQLPhxtXMePcZ
 GUPM1n6ySNbmKgFWPtymCPGYpoOngjt7+tEu+4NMKO8hhLrEo5n7TYH6UJY0n26cZZeI
 ISUv9h1s6tw85BOA8M1pj4yXyuW7qcYFV7/VJIaQwJf8yNPUt7LSJZies1JsjqjjOvNy
 nQ9s8yjMY79AVVE0Qbfah0Vb/XbJwZQxbLK8WirpgQDn1cxxvI7VlNNPOJMaZ2J2Nexw
 csApApHpJpik3mGXXNcvR4S6YqXuSvcLZvNUuj6kx42wbzARZgZMFTvwMssv2vnlUYP+ pg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 336xtv329a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 06:59:51 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07SAlIOW020024;
 Fri, 28 Aug 2020 10:59:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 332utq43j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 10:59:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07SAxkiZ19136934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Aug 2020 10:59:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC7E42042;
 Fri, 28 Aug 2020 10:59:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D25BD4203F;
 Fri, 28 Aug 2020 10:59:45 +0000 (GMT)
Received: from sig-9-65-214-13.ibm.com (unknown [9.65.214.13])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Aug 2020 10:59:45 +0000 (GMT)
Message-ID: <59586987f6050a0cb5b744284895373b7c8232dd.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Fri, 28 Aug 2020 06:59:45 -0400
In-Reply-To: <20200820090824.3033-5-pvorel@suse.cz>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-5-pvorel@suse.cz>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_06:2020-08-28,
 2020-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=3 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=697 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008280078
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 4/5] IMA: Add a test to verify measurement of
 certificate imported into a keyring
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 2020-08-20 at 11:08 +0200, Petr Vorel wrote:
> From: Lachlan Sneff <t-josne@linux.microsoft.com>
> 
> The IMA subsystem supports measuring certificates that have been
> imported into either system built-in or user-defined keyrings.
> A test to verify measurement of a certificate imported
> into a keyring is required.
> 
> Add an IMA measurement test that verifies that an x509 certificate
> can be imported into a newly-created, user-defined keyring and measured
> correctly by the IMA subsystem.
> 
> A certificate used by the test is included in the `datafiles/keys`
> directory.
> 
> There can be restrictions on importing a certificate into a builtin
> trusted keyring. For example, the `.ima` keyring requires that
> imported certs be signed by a kernel private key in certain
> kernel configurations. For this reason, this test defines
> a user-defined keyring and imports a certificate into that.

FYI, similar restrictions could be defined for userspace keyrings. 
Refer to Mat Martineau's LSS 2019 talk titled "Using and Implementing
Keyring Restrictions for Userspace" and the keyctl's "restrict_keyring"
option.

Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
