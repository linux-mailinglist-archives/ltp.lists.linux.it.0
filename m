Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDE2ABF76
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:11:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65ADD3C537B
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:11:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 513793C2378
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:11:40 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A83FF10009F0
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:11:39 +0100 (CET)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9F5Ctm090199; Mon, 9 Nov 2020 10:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : cc :
 subject : in-reply-to : in-reply-to : references : date : message-id :
 mime-version : content-type; s=pp1;
 bh=YYX+6F9LIIRd7yQ0HCuIw7qkiE4+vKYNPU93diVb5u0=;
 b=dvN9C17Rt/MDaipRsFm2DbTd/JV1hp1sHlngy7gOvociKEjZBiQzpHO/LFVRfDY77rje
 WbeCG44opy7JPnQaiwkFbNOA50WML5dB195iz3/5RihgtOu2NO9yUADiZmsJrKTGz9xF
 Gn8G8xX4TakWNo5gxa9rnNRUFnfSDLhAMVYVsPz//vS1WoJ4XJfHfgyrnNxmdAbXCy2W
 hjv0vwGWp3JUcd6ZwtP5aDSJEEX/hkYZTxs1EM9g/Vm3OTbr8qMmlgWdwAwggZvTvhTx
 ejX9Stp4lo9qVOuYgXXUXbYyj4RZ26uJUzyUWZptIluq1t4y1bp25kWHi/UW3HsFkagR Mw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34nnbgxmey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 10:11:37 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A9F3Don013913;
 Mon, 9 Nov 2020 15:11:35 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 34nk7893s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 15:11:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A9FBWKe56164852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Nov 2020 15:11:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3C574204D;
 Mon,  9 Nov 2020 15:11:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 492564203F;
 Mon,  9 Nov 2020 15:11:32 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.3.151])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Nov 2020 15:11:32 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Cyril Hrubis <chrubis@suse.cz>
In-Reply-To: <20201109150943.GB25892@yuki.lan>
In-Reply-To: 
References: <20201109145657.602251-1-egorenar@linux.ibm.com>
 <20201109150943.GB25892@yuki.lan>
Date: Mon, 09 Nov 2020 16:11:31 +0100
Message-ID: <878sba5zvg.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_08:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011090106
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lib/tst_virt: support IBM/Z LPAR and z/VM
 virtualization environments
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
Cc: , ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
> Actually we can simplify the code like this:
>
> +static int is_ibmz(int virt_type)
> +{
> +	FILE *sysinfo;
> +	char line[64];
> +	int found_lpar, found_zvm;
> +
> +	if (virt_type != VIRT_IBMZ_LPAR && virt_type != VIRT_IBMZ_ZVM)
> +		return 0;
> +
> +	if (access("/proc/sysinfo", F_OK) != 0)
> +		return 0;
> +
> +	sysinfo = SAFE_FOPEN(NULL, "/proc/sysinfo", "r");
> +	found_lpar = 0;
> +	found_zvm = 0;
> +	while (fgets(line, sizeof(line), sysinfo) != NULL) {
> +		if (strstr(line, "LPAR"))
> +			found_lpar = 1;
> +		else if (strstr(line, "z/VM"))
> +			found_zvm = 1;
> +	}
> +
> +	SAFE_FCLOSE(NULL, sysinfo);
> +
> +	switch (virt_type) {
> +	case VIRT_IBMZ:
> +		return found_lpar;
> +	case VIRT_IBMZ_LPAR:
> +		return found_lpar && !found_zvm;
> +	case VIRT_IBMZ_ZVM:
> +		return found_lpar && found_zvm;
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static int try_systemd_detect_virt(void)
>  {
>  	FILE *f;
> @@ -102,6 +138,9 @@ static int try_systemd_detect_virt(void)
>  	if (!strncmp("xen", virt_type, 3))
>  		return VIRT_XEN;
>  
> +	if (!strncmp("zvm", virt_type, 3))
> +		return VIRT_IBMZ_ZVM;
> +
>  	return VIRT_OTHER;
>  }
>  
> @@ -118,11 +157,15 @@ int tst_is_virt(int virt_type)
>  
>  	switch (virt_type) {
>  	case VIRT_ANY:
> -		return is_xen() || is_kvm();
> +		return is_xen() || is_kvm() || is_ibmz(VIRT_IBMZ);
>  	case VIRT_XEN:
>  		return is_xen();
>  	case VIRT_KVM:
>  		return is_kvm();
> +	case VIRT_IBMZ:
> +	case VIRT_IBMZ_LPAR:
> +	case VIRT_IBMZ_ZVM:
> +		return is_ibmz(virt_type);
>  	case VIRT_OTHER:
>  		return 0;
>  	}
>
>
> Do you agree with these changes?
>
> -- 
> Cyril Hrubis
> chrubis@suse.cz

Hi, perfect.

Thanks

Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
